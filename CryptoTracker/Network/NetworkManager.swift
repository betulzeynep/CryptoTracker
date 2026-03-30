//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//
import Foundation

final class NetworkManager: NetworkManagerProtocol {
    // MARK: - Properties
    private let session: URLSession
    private let decoder: JSONDecoder
    
    // MARK: - Initialization
    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    // MARK: - NetworkManagerProtocol
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T {
        // 1. Build request from endpoint
        let request = try endpoint.buildRequest()
        
        // 2. Make network call and handle URLErrors
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: request)
        } catch let error as URLError {
            // Convert URLError to our custom NetworkError
            throw NetworkError.from(urlError: error)
        } catch {
            // Any other error
            throw NetworkError.unknown(error)
        }
        
        // 3. Validate it's an HTTPURLResponse
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // 4. Check HTTP status code and map to NetworkError
        try validateStatusCode(httpResponse.statusCode)
        
        // 5. Decode JSON and handle DecodingError
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch let decodingError as DecodingError {
            // Convert DecodingError to our custom NetworkError
            throw NetworkError.decodingError(decodingError)
        } catch {
            // Any other decoding error
            throw NetworkError.unknown(error)
        }
    }
    
    // MARK: - Private Helpers
    
    /// Validates HTTP status code and throws appropriate NetworkError
    private func validateStatusCode(_ statusCode: Int) throws {
        switch statusCode {
        case 200...299:
            // Success - do nothing, continue
            return
            
        // Client errors (4xx)
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 408:
            throw NetworkError.timeout
        case 429:
            throw NetworkError.tooManyRequests
            
        // Server errors (5xx)
        case 500:
            throw NetworkError.internalServerError
        case 503:
            throw NetworkError.serviceUnavailable
            
        // CoinGecko-specific errors (you may need to adjust these based on actual API behavior)
        case 451:
            throw NetworkError.accessDenied
            
        // Unknown status code
        default:
            throw NetworkError.unknown(nil)
        }
    }
}
