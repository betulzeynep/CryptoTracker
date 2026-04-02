//
//  DefaultCryptoFormatter.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Default formatter using USD currency
/// Standard implementation for US market
struct DefaultCryptoFormatter: CryptoFormatterProtocol {
    
    let currencyCode: String = "USD"
    
    func formatPrice(_ value: Double) -> String {
        value.formatted(.currency(code: currencyCode))
    }
    
    func formatPercentage(_ value: Double?) -> String {
        guard let value = value else {
            return "--"
        }
        return String(format: "%.2f%%", abs(value))
    }
    
    func formatRank(_ rank: Int) -> String {
        "\(Symbols.hash)\(rank)"
    }
}

/// European formatter using EUR currency
/// Implementation for European market
struct EURCryptoFormatter: CryptoFormatterProtocol {
    
    let currencyCode: String = "EUR"
    
    func formatPrice(_ value: Double) -> String {
        value.formatted(.currency(code: currencyCode))
    }
    
    func formatPercentage(_ value: Double?) -> String {
        guard let value = value else {
            return "--"
        }
        // European style uses comma for decimals
        return String(format: "%.2f%%", abs(value)).replacingOccurrences(of: ".", with: ",")
    }
    
    func formatRank(_ rank: Int) -> String {
        "\(Symbols.hash)\(rank)"
    }
}

/// Compact formatter with shorter number representations
/// Useful for widgets or compact views
struct CompactCryptoFormatter: CryptoFormatterProtocol {
    
    let currencyCode: String = "USD"
    
    func formatPrice(_ value: Double) -> String {
        if value >= 1_000_000 {
            // Show millions (e.g., "$1.2M")
            return String(format: "$%.1fM", value / 1_000_000)
        } else if value >= 1_000 {
            // Show thousands (e.g., "$65.4K")
            return String(format: "$%.1fK", value / 1_000)
        } else {
            // Show normal (e.g., "$123.45")
            return value.formatted(.currency(code: currencyCode))
        }
    }
    
    func formatPercentage(_ value: Double?) -> String {
        guard let value = value else {
            return "--"
        }
        // Compact: "2.5%" instead of "2.50%"
        return String(format: "%.1f%%", abs(value))
    }
    
    func formatRank(_ rank: Int) -> String {
        "\(Symbols.hash)\(rank)"
    }
}

// MARK: - Default Instance
extension CryptoFormatterProtocol where Self == DefaultCryptoFormatter {
    /// Convenience accessor for default USD formatter
    static var `default`: DefaultCryptoFormatter {
        DefaultCryptoFormatter()
    }
}

extension CryptoFormatterProtocol where Self == EURCryptoFormatter {
    /// Convenience accessor for EUR formatter
    static var eur: EURCryptoFormatter {
        EURCryptoFormatter()
    }
}

extension CryptoFormatterProtocol where Self == CompactCryptoFormatter {
    /// Convenience accessor for compact formatter
    static var compact: CompactCryptoFormatter {
        CompactCryptoFormatter()
    }
}
