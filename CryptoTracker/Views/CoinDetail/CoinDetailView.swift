//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//
import SwiftUI

// TODO #11: Complete CoinDetailView implementation
// See TODO.txt for detailed implementation guide

struct CoinDetailView: View {
    let coinId: String
    @State private var viewModel = CoinDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.large) {
                // Show chart if data is available
                if let ohlcData = viewModel.ohlcData, !ohlcData.isEmpty {
                    CandlestickChartView(data: ohlcData)
                } else if viewModel.isLoadingOHLC {
                    ProgressView("Loading chart...")
                        .frame(height: 300)
                } else {
                    Text("No chart data available")
                        .frame(height: 300)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle(coinId.capitalized)
        .task {
            await viewModel.fetchCoinDetail(id: coinId)
            await viewModel.fetchOHLCData(id: coinId, days: 7)
        }
    }
}

#Preview {
    NavigationStack {
        CoinDetailView(coinId: "bitcoin")
    }
}
