//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//
import SwiftUI
import Charts

// TODO #11: Complete CoinDetailView implementation
// See TODO.txt for detailed implementation guide

struct CoinDetailView: View {
    let coinId: String
    @State private var viewModel = CoinDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // TODO: Add header section with coin image, name, current price
                
                // TODO #13: Add candlestick chart here
                // CandlestickChartView(data: viewModel.ohlcData ?? [])
                
                // TODO #14: Add time range selector
                
                // TODO #17: Add statistics grid
                
                // TODO: Add description/about section
            }
            .padding()
        }
        .navigationTitle(coinId.capitalized)
        .task {
            await viewModel.fetchCoinDetail(id: coinId)
            // TODO #16: await viewModel.fetchOHLCData(id: coinId, range: .week)
        }
    }
}

// TODO #13: Create this component
// struct CandlestickChartView: View {
//     let data: [OHLC]
//     
//     var body: some View {
//         Chart(data) { ohlc in
//             // Candlestick body
//             RectangleMark(
//                 x: .value("Time", ohlc.date),
//                 yStart: .value("Open", ohlc.open),
//                 yEnd: .value("Close", ohlc.close)
//             )
//             .foregroundStyle(ohlc.isBullish ? .green : .red)
//             
//             // High-Low wick
//             RuleMark(
//                 x: .value("Time", ohlc.date),
//                 yStart: .value("Low", ohlc.low),
//                 yEnd: .value("High", ohlc.high)
//             )
//             .foregroundStyle(.gray)
//         }
//         .frame(height: 300)
//         .chartYAxis {
//             AxisMarks(position: .trailing)
//         }
//     }
// }

#Preview {
    NavigationStack {
        CoinDetailView(coinId: "bitcoin")
    }
}
