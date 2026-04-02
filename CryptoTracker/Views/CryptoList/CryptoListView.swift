//
//  CryptoListView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//
import SwiftUI

struct CryptoListView: View {
    @State private var viewModel = CryptoListViewModel()
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Crypto Tracker")
                .task {
                    await viewModel.fetchCryptos()
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView("Loading cryptocurrencies...")
        } else if let errorMessage = viewModel.errorMessage {
            ContentUnavailableView {
                Label("Error", systemImage: "exclamationmark.triangle")
            } description: {
                Text(errorMessage)
            } actions: {
                Button("Retry") {
                    Task {
                        await viewModel.fetchCryptos()
                    }
                }
            }
        } else {
            List(viewModel.cryptos, id: \.id) { crypto in
                NavigationLink(value: crypto.id) {
                    CryptoRow(crypto: crypto)
                }
            }
            .navigationDestination(for: String.self) { coinId in
                CoinDetailView(coinId: coinId)
            }
        }
    }
}

#Preview {
    CryptoListView()
}
