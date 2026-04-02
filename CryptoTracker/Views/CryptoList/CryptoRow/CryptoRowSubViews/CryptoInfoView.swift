//
//  CryptoInfoView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

/// Displays cryptocurrency name, symbol, and current price
/// Reusable component for showing crypto information
struct CryptoInfoView: View {
    let name: String
    let symbol: String
    let formattedPrice: String
    
    /// Initialize with individual properties for maximum flexibility
    init(name: String, symbol: String, formattedPrice: String) {
        self.name = name
        self.symbol = symbol
        self.formattedPrice = formattedPrice
    }
    
    /// Convenience initializer that takes the whole crypto object
    init(crypto: CryptoCurrency) {
        self.name = crypto.name
        self.symbol = crypto.symbol
        self.formattedPrice = crypto.formattedPrice
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.xSmall) {
            // First line: Name and Symbol
            HStack(spacing: Spacing.xSmall) {
                Text(name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.textPrimary)
                
                Text(symbol.uppercased())
                    .font(.subheadline)
                    .foregroundStyle(Color.textSecondary)
            }
            
            // Second line: Price
            Text(formattedPrice)
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(Color.textPrimary)
        }
    }
}

// MARK: - Previews
#Preview("With Crypto Object") {
    CryptoInfoView(crypto: CryptoCurrency.sample)
        .padding()
}

#Preview("With Individual Properties") {
    VStack(alignment: .leading, spacing: Spacing.large) {
        CryptoInfoView(
            name: "Bitcoin",
            symbol: "btc",
            formattedPrice: "$65,432.10"
        )
        
        CryptoInfoView(
            name: "Ethereum",
            symbol: "eth",
            formattedPrice: "$3,456.78"
        )
    }
    .padding()
}
