//
//  Icons.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Design system icon names for consistent SF Symbols usage
/// Usage: Image(systemName: Icons.cryptoPlaceholder)
enum Icons {
    // MARK: - Crypto Related
    /// Placeholder icon for crypto images
    static let cryptoPlaceholder = "bitcoinsign.circle.fill"
    
    /// Bitcoin symbol
    static let bitcoin = "bitcoinsign.circle"
    
    /// Generic currency symbol
    static let currency = "dollarsign.circle"
    
    // MARK: - Arrows & Indicators
    /// Up arrow for positive price change
    static let arrowUp = "arrow.up"
    
    /// Down arrow for negative price change
    static let arrowDown = "arrow.down"
    
    /// Triangle up for alternative positive indicator
    static let triangleUp = "arrowshape.up.fill"
    
    /// Triangle down for alternative negative indicator
    static let triangleDown = "arrowshape.down.fill"
    
    // MARK: - Chart & Graph
    /// Line chart icon
    static let chart = "chart.line.uptrend.xyaxis"
    
    /// Bar chart icon
    static let barChart = "chart.bar.fill"
    
    // MARK: - Actions
    /// Refresh/reload icon
    static let refresh = "arrow.clockwise"
    
    /// Search icon
    static let search = "magnifyingglass"
    
    /// Star for favorites
    static let star = "star"
    static let starFilled = "star.fill"
    
    // MARK: - Status
    /// Error indicator
    static let error = "exclamationmark.triangle"
    
    /// Warning indicator
    static let warning = "exclamationmark.circle"
    
    /// Success/checkmark
    static let success = "checkmark.circle"
    
    /// Info icon
    static let info = "info.circle"
}
