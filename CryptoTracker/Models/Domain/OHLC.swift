//
//  OHLC.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

// MARK: - OHLC (Open, High, Low, Close)
/// Represents candlestick data for charting
/// 
/// TODO: Integrate with Swift Charts
/// - Add Identifiable conformance for chart data
/// - Create ChartDataProvider extension for time series
/// - Consider adding volume data for complete candlestick charts
struct OHLC: Codable {
    let timestamp: TimeInterval  // Unix timestamp in milliseconds
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    
    // MARK: - Custom Decoding
    /// Custom initializer to decode from array format: [timestamp, open, high, low, close]
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        // Decode array elements in order
        guard container.count == 5 else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Expected 5 values for OHLC data, got \(container.count ?? 0)"
            )
        }
        
        timestamp = try container.decode(TimeInterval.self)
        open = try container.decode(Double.self)
        high = try container.decode(Double.self)
        low = try container.decode(Double.self)
        close = try container.decode(Double.self)
    }
    
    // MARK: - Custom Encoding
    /// Custom encoder to encode back to array format
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(timestamp)
        try container.encode(open)
        try container.encode(high)
        try container.encode(low)
        try container.encode(close)
    }
    
    // MARK: - Standard Initializer
    /// Standard initializer for creating OHLC instances
    init(timestamp: TimeInterval, open: Double, high: Double, low: Double, close: Double) {
        self.timestamp = timestamp
        self.open = open
        self.high = high
        self.low = low
        self.close = close
    }
}

// MARK: - Identifiable Conformance
// TODO #12: This makes OHLC work seamlessly with Swift Charts
extension OHLC: Identifiable {
    var id: TimeInterval { timestamp }
}

// MARK: - Computed Properties
extension OHLC {
    /// Convert timestamp to Date
    var date: Date {
        Date(timeIntervalSince1970: timestamp / 1000)  // Convert milliseconds to seconds
    }
    
    /// Formatted date string
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    /// Price change amount
    var priceChange: Double {
        close - open
    }
    
    /// Price change percentage
    var priceChangePercentage: Double {
        guard open != 0 else { return 0 }
        return ((close - open) / open) * 100
    }
    
    /// Whether the candle is bullish (closed higher than opened)
    var isBullish: Bool {
        close > open
    }
    
    /// Whether the candle is bearish (closed lower than opened)
    var isBearish: Bool {
        close < open
    }
    
    /// Price range (high - low)
    var range: Double {
        high - low
    }
}

// MARK: - Sample Data
#if DEBUG
extension OHLC {
    static let sample = OHLC(
        timestamp: 1774296000000,
        open: 70240,
        high: 71110,
        low: 70240,
        close: 70674
    )
    
    static let sampleArray: [OHLC] = [
        OHLC(timestamp: 1774296000000, open: 70240, high: 71110, low: 70240, close: 70674),
        OHLC(timestamp: 1774382400000, open: 70674, high: 72000, low: 70100, close: 71500),
        OHLC(timestamp: 1774468800000, open: 71500, high: 73000, low: 71200, close: 72800),
        OHLC(timestamp: 1774555200000, open: 72800, high: 74000, low: 72500, close: 73200),
        OHLC(timestamp: 1774641600000, open: 73200, high: 73500, low: 71800, close: 72100)
    ]
}
#endif
