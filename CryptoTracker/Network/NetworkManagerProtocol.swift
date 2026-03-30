//
//  NetworkManagerProtocol.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkManagerProtocol {
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T
}
