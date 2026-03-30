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
        // TODO: Implement the actual network call
        // 1. Build URLRequest from endpoint
        // 2. Make network call with URLSession
        // 3. Validate response
        // 4. Decode JSON
        // 5. Return result or throw error
        
        fatalError("Not implemented yet")
    }
}
