//
//  CryptoRow.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//

import SwiftUI

struct CryptoRow: View {
    let crypto: CryptoCurrency
    var body: some View {
        HStack(spacing: 12) {
            // MARK: - Left: Coin Image
            AsyncImage(url: URL(string: crypto.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "bitcoinsign.circle.fill")
                        .foregroundStyle(.orange)
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            
            // MARK: - Middle: Name, Symbol & Price
            VStack(alignment: .leading, spacing: 4) {
                // First line: Name and Symbol
                HStack(spacing: 4) {
                    Text(crypto.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(crypto.symbol.uppercased())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                // Second line: Price
                Text(crypto.currentPrice.formatted(.currency(code: "USD")))
                    .font(.body)
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            // MARK: - Right: Rank & Price Change
            VStack(alignment: .trailing, spacing: 4) {
                // Market cap rank
                Text("#\(crypto.marketCapRank)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                // 24h price change
                if let change = crypto.priceChangePercentage24H {
                    HStack(spacing: 2) {
                        Text(change >= 0 ? "↑" : "↓")
                        Text(String(format: "%.2f%%", abs(change)))
                    }
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(change >= 0 ? .green : .red)
                } else {
                    Text("--")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
    }
}

#Preview {
    List {
        CryptoRow(crypto: CryptoCurrency.sample)
        CryptoRow(crypto: CryptoCurrency.sample)
        CryptoRow(crypto: CryptoCurrency.sample)
    }
}
