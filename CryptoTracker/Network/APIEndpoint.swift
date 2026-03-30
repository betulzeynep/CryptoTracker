//
//  APIEndpoint.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

// MARK: - APIEndpoint
protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
}

// MARK: - Default Implementation
extension APIEndpoint {
    /// Builds the complete URL with query parameters
    func buildURL() throws -> URL {
        // Combine base URL and path
        let urlString = baseURL + path
        
        guard var components = URLComponents(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        // Add query parameters if they exist
        if let queryParameters = queryParameters {
            components.queryItems = queryParameters.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        return url
    }
    
    /// Builds a URLRequest with all endpoint properties
    func buildRequest() throws -> URLRequest {
        let url = try buildURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Add headers if they exist
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}

enum CoinGeckoEndpoint: APIEndpoint {
    // MARK: - Cases
    case markets(currency: String, perPage: Int, page: Int)
    case coinDetail(id: String)
    case ohlc(id: String, currency: String, days: Int)
    
    // MARK: - APIEndpoint Conformance
    
    var baseURL: String {
        "https://api.coingecko.com/api/v3"
    }
    
    var path: String {
        switch self {
        case .markets:
            return "/coins/markets"
        case .coinDetail(let id):
            return "/coins/\(id)"
        case .ohlc(let id, _, _):
            return "/coins/\(id)/ohlc"
        }
    }
    
    var method: HTTPMethod {
        .get  // All CoinGecko endpoints are GET
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
        // No API key needed for free tier!
    }
    
    var queryParameters: [String: String]? {
        switch self {
        case .markets(let currency, let perPage, let page):
            return [
                "vs_currency": currency,
                "order": "market_cap_desc",
                "per_page": "\(perPage)",
                "page": "\(page)"
            ]
        case .coinDetail:
            return nil
        case .ohlc(_, let currency, let days):
            return [
                "vs_currency": currency,
                "days": "\(days)"
            ]
        }
    }
}
