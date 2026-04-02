//
//  CryptoCurrency+Formatting.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 1.04.2026.
//

import Foundation

// MARK: - Presentation Logic (Default Formatting)
// Note: These use the default formatter. For custom formatting, use CryptoFormatterProtocol directly
extension CryptoCurrency {
    
    /// Default formatter instance used by convenience properties
    private static let defaultFormatter: CryptoFormatterProtocol = DefaultCryptoFormatter()
    
    /// Formatted price in USD currency format (convenience property)
    /// For other currencies, use formatter.formatPrice(crypto.currentPrice)
    /// Example: "$65,432.10"
    var formattedPrice: String {
        Self.defaultFormatter.formatPrice(currentPrice)
    }
    
    /// Formatted market cap rank with # prefix
    /// Example: "#1"
    var formattedRank: String {
        Self.defaultFormatter.formatRank(marketCapRank)
    }
    
    /// Formatted price change percentage
    /// Example: "2.50%" or "--" if nil
    var formattedPriceChange: String {
        Self.defaultFormatter.formatPercentage(priceChangePercentage24H)
    }
    
    /// Symbol representing price direction (up or down arrow)
    /// Returns: "↑" for positive, "↓" for negative, or "" if no change data
    var priceChangeSymbol: String {
        guard let change = priceChangePercentage24H else {
            return ""
        }
        return change >= 0 ? Symbols.arrowUp : Symbols.arrowDown
    }
    
    /// Indicates if price went up in the last 24 hours
    var isPriceIncreasing: Bool {
        guard let change = priceChangePercentage24H else {
            return false
        }
        return change >= 0
    }
}

// MARK: - Formatter-Based Methods (Protocol-Oriented)
extension CryptoCurrency {
    
    /// Formats price using a specific formatter
    /// - Parameter formatter: The formatter to use
    /// - Returns: Formatted price string
    /// 
    /// Example:
    /// ```swift
    /// let usdPrice = crypto.formatPrice(using: .default)
    /// let eurPrice = crypto.formatPrice(using: .eur)
    /// let compactPrice = crypto.formatPrice(using: .compact)
    /// ```
    func formatPrice(using formatter: CryptoFormatterProtocol) -> String {
        formatter.formatPrice(currentPrice)
    }
    
    /// Formats percentage using a specific formatter
    /// - Parameter formatter: The formatter to use
    /// - Returns: Formatted percentage string
    func formatPercentageChange(using formatter: CryptoFormatterProtocol) -> String {
        formatter.formatPercentage(priceChangePercentage24H)
    }
    
    /// Formats rank using a specific formatter
    /// - Parameter formatter: The formatter to use
    /// - Returns: Formatted rank string
    func formatRank(using formatter: CryptoFormatterProtocol) -> String {
        formatter.formatRank(marketCapRank)
    }
}

