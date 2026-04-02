//
//  CryptoFormatterProtocol.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Protocol for formatting cryptocurrency data
/// Allows different formatting strategies to be used throughout the app
/// Follows Open/Closed Principle - open for extension, closed for modification
protocol CryptoFormatterProtocol {
    /// Formats a price value with appropriate currency
    /// - Parameter value: The price value to format
    /// - Returns: Formatted price string (e.g., "$65,432.10")
    func formatPrice(_ value: Double) -> String
    
    /// Formats a percentage value
    /// - Parameter value: The percentage value to format (can be nil)
    /// - Returns: Formatted percentage string (e.g., "2.50%") or "--" if nil
    func formatPercentage(_ value: Double?) -> String
    
    /// Formats a market cap rank with prefix
    /// - Parameter rank: The rank number
    /// - Returns: Formatted rank string (e.g., "#1")
    func formatRank(_ rank: Int) -> String
    
    /// The currency code this formatter uses (e.g., "USD", "EUR")
    var currencyCode: String { get }
}

