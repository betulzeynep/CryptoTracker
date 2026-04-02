//
//  Spacing.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Design system spacing values for consistent layout
/// Usage: .padding(Spacing.medium)
enum Spacing {
    /// 2pt - Minimal spacing between closely related elements
    static let xxSmall: CGFloat = 2
    
    /// 4pt - Small spacing for compact layouts
    static let xSmall: CGFloat = 4
    
    /// 8pt - Standard small spacing
    static let small: CGFloat = 8
    
    /// 12pt - Medium spacing (row elements)
    static let medium: CGFloat = 12
    
    /// 16pt - Standard padding
    static let standard: CGFloat = 16
    
    /// 20pt - Large spacing
    static let large: CGFloat = 20
    
    /// 24pt - Extra large spacing
    static let xLarge: CGFloat = 24
    
    /// 32pt - Section spacing
    static let xxLarge: CGFloat = 32
}
