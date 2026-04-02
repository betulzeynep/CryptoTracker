//
//  Symbols.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import Foundation

/// Design system symbols and special characters
/// Usage: Text(Symbols.arrowUp)
enum Symbols {
    // MARK: - Directional Arrows
    /// ↑ - Up arrow for positive changes
    static let arrowUp = "↑"
    
    /// ↓ - Down arrow for negative changes
    static let arrowDown = "↓"
    
    /// → - Right arrow
    static let arrowRight = "→"
    
    /// ← - Left arrow
    static let arrowLeft = "←"
    
    // MARK: - Special Characters
    /// • - Bullet point
    static let bullet = "•"
    
    /// — - Em dash
    static let dash = "—"
    
    /// – - En dash
    static let enDash = "–"
    
    /// … - Ellipsis
    static let ellipsis = "…"
    
    // MARK: - Currency
    /// $ - Dollar sign
    static let dollar = "$"
    
    /// € - Euro sign
    static let euro = "€"
    
    /// £ - Pound sign
    static let pound = "£"
    
    /// ¥ - Yen sign
    static let yen = "¥"
    
    // MARK: - Math & Numbers
    /// + - Plus sign
    static let plus = "+"
    
    /// − - Minus sign
    static let minus = "−"
    
    /// × - Multiplication sign
    static let multiply = "×"
    
    /// ÷ - Division sign
    static let divide = "÷"
    
    /// % - Percent sign
    static let percent = "%"
    
    /// # - Hash/Number sign
    static let hash = "#"
}
