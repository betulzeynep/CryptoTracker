//
//  CryptoService.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

final class CryptoService {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchTopCryptos(limit: Int = 50, currency: String = "usd") async throws -> [CryptoCurrency] {
        let endpoint = CoinGeckoEndpoint.markets(
            currency: currency,
            perPage: limit,
            page: 1
        )
        return try await networkManager.request(
            endpoint: endpoint,
            responseType: [CryptoCurrency].self
        )
    }
    
    func fetchCoinDetail(id: String) async throws -> CoinDetail {
        let endpoint = CoinGeckoEndpoint.coinDetail(id: id)
        return try await networkManager.request(
            endpoint: endpoint,
            responseType: CoinDetail.self
        )
    }
    
    func fetchPriceHistory(id: String, currency: String = "usd", days: Int = 7) async throws -> [OHLC] {
        let endpoint = CoinGeckoEndpoint.ohlc(
            id: id,
            currency: currency,
            days: days)
        
        return try await networkManager.request(
            endpoint: endpoint,
            responseType: [OHLC].self
        )
    }
}
