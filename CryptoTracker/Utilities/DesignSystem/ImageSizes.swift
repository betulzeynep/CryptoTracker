//
//  ImageSizes.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Design system image size values for consistent imagery
/// Usage: .frame(width: ImageSizes.cryptoIcon, height: ImageSizes.cryptoIcon)
enum ImageSizes {
    /// 32pt - Small crypto icon (e.g., in compact views)
    static let cryptoIconSmall: CGFloat = 32
    
    /// 48pt - Standard crypto icon (list rows)
    static let cryptoIcon: CGFloat = 48
    
    /// 64pt - Large crypto icon (detail headers)
    static let cryptoIconLarge: CGFloat = 64
    
    /// 80pt - Extra large crypto icon (featured displays)
    static let cryptoIconXLarge: CGFloat = 80
    
    /// 100pt - Hero crypto icon
    static let cryptoIconHero: CGFloat = 100
    
    // Convenience alias for backward compatibility
    static let crypto: CGFloat = cryptoIcon
}
