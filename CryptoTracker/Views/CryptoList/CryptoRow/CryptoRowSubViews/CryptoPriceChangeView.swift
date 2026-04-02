//
//  CryptoPriceChangeView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

/// Displays cryptocurrency rank and 24-hour price change
/// Reusable badge component that can be used in lists, detail views, or widgets
struct CryptoPriceChangeView: View {
    let rank: String
    let priceChangeSymbol: String
    let priceChangeText: String
    let isIncreasing: Bool
    let hasChange: Bool
    
    /// Initialize with individual properties for maximum flexibility
    init(
        rank: String,
        priceChangeSymbol: String,
        priceChangeText: String,
        isIncreasing: Bool,
        hasChange: Bool
    ) {
        self.rank = rank
        self.priceChangeSymbol = priceChangeSymbol
        self.priceChangeText = priceChangeText
        self.isIncreasing = isIncreasing
        self.hasChange = hasChange
    }
    
    /// Convenience initializer that takes the whole crypto object
    init(crypto: CryptoCurrency) {
        self.rank = crypto.formattedRank
        self.priceChangeSymbol = crypto.priceChangeSymbol
        self.priceChangeText = crypto.formattedPriceChange
        self.isIncreasing = crypto.isPriceIncreasing
        self.hasChange = crypto.priceChangePercentage24H != nil
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: Spacing.xSmall) {
            // Market cap rank
            Text(rank)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.textSecondary)
            
            // 24h price change
            if hasChange {
                HStack(spacing: Spacing.xxSmall) {
                    Text(priceChangeSymbol)
                    Text(priceChangeText)
                }
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(isIncreasing ? Color.priceIncrease : Color.priceDecrease)
            } else {
                Text("--")
                    .font(.subheadline)
                    .foregroundStyle(Color.textSecondary)
            }
        }
    }
}

// MARK: - Previews
#Preview("With Crypto Object - Increasing") {
    CryptoPriceChangeView(crypto: CryptoCurrency.sample)
        .padding()
}

#Preview("Individual Values") {
    VStack(alignment: .trailing, spacing: Spacing.large) {
        // Increasing
        CryptoPriceChangeView(
            rank: "#1",
            priceChangeSymbol: Symbols.arrowUp,
            priceChangeText: "2.50%",
            isIncreasing: true,
            hasChange: true
        )
        
        // Decreasing
        CryptoPriceChangeView(
            rank: "#2",
            priceChangeSymbol: Symbols.arrowDown,
            priceChangeText: "1.23%",
            isIncreasing: false,
            hasChange: true
        )
        
        // No change data
        CryptoPriceChangeView(
            rank: "#10",
            priceChangeSymbol: "",
            priceChangeText: "--",
            isIncreasing: false,
            hasChange: false
        )
    }
    .padding()
}

#Preview("In Dark Mode") {
    CryptoPriceChangeView(crypto: CryptoCurrency.sample)
        .padding()
        .preferredColorScheme(.dark)
}
