//
//  CoinDetail.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

// MARK: - CoinDetail
/// Detailed information about a single cryptocurrency
struct CoinDetail: Codable {
    let id: String
    let symbol: String
    let name: String
    let description: Description?
    let image: CoinImage?
    let marketCapRank: Int?
    let marketData: MarketData?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, description, image
        case marketCapRank = "market_cap_rank"
        case marketData = "market_data"
        case links
    }
}

// MARK: - Description
struct Description: Codable {
    let en: String?  // English description
    
    /// Get the description text, fallback to empty string
    var text: String {
        en ?? ""
    }
}

// MARK: - CoinImage
struct CoinImage: Codable {
    let thumb: String?
    let small: String?
    let large: String?
    
    /// Get the best available image URL
    var bestURL: String? {
        large ?? small ?? thumb
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    // Current prices in different currencies
    let currentPrice: [String: Double]?
    
    // Market metrics
    let marketCap: [String: Double]?
    let totalVolume: [String: Double]?
    let fullyDilutedValuation: [String: Double]?
    
    // 24h data
    let high24h: [String: Double]?
    let low24h: [String: Double]?
    let priceChange24h: Double?
    let priceChangePercentage24h: Double?
    
    // 7d, 30d, 1y changes
    let priceChangePercentage7d: Double?
    let priceChangePercentage30d: Double?
    let priceChangePercentage1y: Double?
    
    // All-time high
    let ath: [String: Double]?
    let athChangePercentage: [String: Double]?
    let athDate: [String: String]?
    
    // All-time low
    let atl: [String: Double]?
    let atlChangePercentage: [String: Double]?
    let atlDate: [String: String]?
    
    // Supply data
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case priceChangePercentage7d = "price_change_percentage_7d"
        case priceChangePercentage30d = "price_change_percentage_30d"
        case priceChangePercentage1y = "price_change_percentage_1y"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
    }
}

// MARK: - Links
struct Links: Codable {
    let homepage: [String]?
    let blockchainSite: [String]?
    let officialForumUrl: [String]?
    let subredditUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case blockchainSite = "blockchain_site"
        case officialForumUrl = "official_forum_url"
        case subredditUrl = "subreddit_url"
    }
    
    /// Get the first valid homepage URL
    var website: String? {
        homepage?.first(where: { !$0.isEmpty })
    }
    
    /// Get the first valid blockchain explorer URL
    var explorer: String? {
        blockchainSite?.first(where: { !$0.isEmpty })
    }
}

// MARK: - Computed Properties for Easy Access
extension CoinDetail {
    /// Get USD price from market data
    var priceUSD: Double? {
        marketData?.currentPrice?["usd"]
    }
    
    /// Get USD market cap from market data
    var marketCapUSD: Double? {
        marketData?.marketCap?["usd"]
    }
    
    /// Get 24h high in USD
    var high24hUSD: Double? {
        marketData?.high24h?["usd"]
    }
    
    /// Get 24h low in USD
    var low24hUSD: Double? {
        marketData?.low24h?["usd"]
    }
    
    /// Get all-time high in USD
    var athUSD: Double? {
        marketData?.ath?["usd"]
    }
    
    /// Get all-time low in USD
    var atlUSD: Double? {
        marketData?.atl?["usd"]
    }
    
    /// Get website URL
    var websiteURL: String? {
        links?.website
    }
    
    /// Get large image URL
    var imageURL: String? {
        image?.bestURL
    }
    
    /// Get description text
    var descriptionText: String {
        description?.text ?? "No description available."
    }
}

// MARK: - Sample Data for Previews
#if DEBUG
extension CoinDetail {
    static let sample = CoinDetail(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        description: Description(en: "Bitcoin is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto."),
        image: CoinImage(
            thumb: "https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png",
            small: "https://coin-images.coingecko.com/coins/images/1/small/bitcoin.png",
            large: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png"
        ),
        marketCapRank: 1,
        marketData: MarketData(
            currentPrice: ["usd": 65000.0],
            marketCap: ["usd": 1_200_000_000_000],
            totalVolume: ["usd": 25_000_000_000],
            fullyDilutedValuation: ["usd": 1_400_000_000_000],
            high24h: ["usd": 66000.0],
            low24h: ["usd": 64000.0],
            priceChange24h: 1000.0,
            priceChangePercentage24h: 1.56,
            priceChangePercentage7d: 3.2,
            priceChangePercentage30d: 8.5,
            priceChangePercentage1y: 125.0,
            ath: ["usd": 69000.0],
            athChangePercentage: ["usd": -5.8],
            athDate: ["usd": "2021-11-10T14:24:11.849Z"],
            atl: ["usd": 67.81],
            atlChangePercentage: ["usd": 95789.5],
            atlDate: ["usd": "2013-07-06T00:00:00.000Z"],
            circulatingSupply: 19_500_000,
            totalSupply: 21_000_000,
            maxSupply: 21_000_000
        ),
        links: Links(
            homepage: ["https://bitcoin.org"],
            blockchainSite: ["https://blockchain.com"],
            officialForumUrl: ["https://bitcointalk.org"],
            subredditUrl: "https://www.reddit.com/r/Bitcoin/"
        )
    )
}
#endif
