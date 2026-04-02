//
//  CandlestickChartView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI
import Charts
// TODO #13: Create this component
struct CandlestickChartView: View {
    let data: [OHLC]
    
    var body: some View {
        Chart(data) { ohlc in
            // Candlestick body
            RectangleMark(
                x: .value("Time", ohlc.date),
                yStart: .value("Open", ohlc.open),
                yEnd: .value("Close", ohlc.close)
            )
            .foregroundStyle(ohlc.isBullish ? Color.priceIncrease : Color.priceDecrease)
            
            // High-Low wick
            RuleMark(
                x: .value("Time", ohlc.date),
                yStart: .value("Low", ohlc.low),
                yEnd: .value("High", ohlc.high)
            )
            .foregroundStyle(.gray)
        }
        .frame(height: 300)
        .chartYAxis {
            AxisMarks(position: .trailing)
        }
    }
}

#Preview() {
    CandlestickChartView(data: [OHLC.sample])
}
