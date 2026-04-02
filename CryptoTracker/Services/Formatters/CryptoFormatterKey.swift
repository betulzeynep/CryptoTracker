//
//  CryptoFormatterKey.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

/// Environment key for injecting CryptoFormatter throughout the app
/// Allows views to access the current formatter without passing it explicitly
struct CryptoFormatterKey: EnvironmentKey {
    static let defaultValue: CryptoFormatterProtocol = DefaultCryptoFormatter()
}

extension EnvironmentValues {
    /// Access the current crypto formatter from the environment
    /// Usage: @Environment(\.cryptoFormatter) var formatter
    var cryptoFormatter: CryptoFormatterProtocol {
        get { self[CryptoFormatterKey.self] }
        set { self[CryptoFormatterKey.self] = newValue }
    }
}

// MARK: - View Extension for Easy Injection
extension View {
    /// Injects a crypto formatter into the environment
    /// - Parameter formatter: The formatter to inject
    /// - Returns: Modified view with formatter in environment
    /// 
    /// Usage:
    /// ```swift
    /// ContentView()
    ///     .cryptoFormatter(.default)  // USD
    ///     .cryptoFormatter(.eur)      // EUR
    ///     .cryptoFormatter(.compact)  // Compact
    /// ```
    func cryptoFormatter(_ formatter: CryptoFormatterProtocol) -> some View {
        environment(\.cryptoFormatter, formatter)
    }
}
