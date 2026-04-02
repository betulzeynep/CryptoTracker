//
//  CryptoRow.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//

import SwiftUI

/// Row component for displaying cryptocurrency information in a list
/// Composed of reusable subviews: CryptoImageView, CryptoInfoView, CryptoPriceChangeView
struct CryptoRow: View {
    let crypto: CryptoCurrency
    
    var body: some View {
        HStack(spacing: Spacing.medium) {
            // Left: Coin Image
            CryptoImageView(crypto: crypto)
            
            // Middle: Name, Symbol & Price
            CryptoInfoView(crypto: crypto)
            
            Spacer()
            
            // Right: Rank & Price Change
            CryptoPriceChangeView(crypto: crypto)
        }
        .padding(Spacing.standard)
    }
}

// MARK: - Previews
#Preview("Single Row") {
    CryptoRow(crypto: CryptoCurrency.sample)
}

#Preview("In List") {
    List {
        CryptoRow(crypto: CryptoCurrency.sample)
        CryptoRow(crypto: CryptoCurrency.sample)
        CryptoRow(crypto: CryptoCurrency.sample)
    }
}

#Preview("Dark Mode") {
    List {
        CryptoRow(crypto: CryptoCurrency.sample)
    }
    .preferredColorScheme(.dark)
}
