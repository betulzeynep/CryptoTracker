//
//  MarketList.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

// MARK: - CryptoCurrency
struct CryptoCurrency: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Int
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply: Double
    let maxSupply: Double?
    let ath, athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
    }
}

// MARK: - Sample Data
#if DEBUG
extension CryptoCurrency {
    static let sample = CryptoCurrency(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png",
        currentPrice: 65432.10,
        marketCap: 1200000000000,
        marketCapRank: 1,
        fullyDilutedValuation: 1300000000000,
        totalVolume: 25000000000,
        high24H: 66000,
        low24H: 64000,
        priceChange24H: 1000,
        priceChangePercentage24H: 2.5,
        marketCapChange24H: 5000000000,
        marketCapChangePercentage24H: 0.42,
        circulatingSupply: 19500000,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69000,
        athChangePercentage: -5.2,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 96429.5,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2026-03-31T12:00:00.000Z"
    )
}
#endif
