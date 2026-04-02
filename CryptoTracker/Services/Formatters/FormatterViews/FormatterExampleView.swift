//
//  FormatterExampleView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

/// Example view demonstrating the protocol-oriented formatter system
/// Shows how different formatters can be swapped at runtime
struct FormatterExampleView: View {
    @State private var selectedFormatter: FormatterType = .usd
    
    enum FormatterType: String, CaseIterable, Identifiable {
        case usd = "USD (Default)"
        case eur = "EUR (European)"
        case compact = "Compact"
        
        var id: String { rawValue }
        
        var formatter: CryptoFormatterProtocol {
            switch self {
            case .usd: return DefaultCryptoFormatter()
            case .eur: return EURCryptoFormatter()
            case .compact: return CompactCryptoFormatter()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: Spacing.large) {
                // Formatter Selection
                Picker("Formatter", selection: $selectedFormatter) {
                    ForEach(FormatterType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // Example List
                List {
                    CryptoRow(crypto: CryptoCurrency.sample)
                    CryptoRow(crypto: CryptoCurrency.sample)
                    CryptoRow(crypto: CryptoCurrency.sample)
                }
                .cryptoFormatter(selectedFormatter.formatter) // ← Inject formatter!
            }
            .navigationTitle("Formatter Demo")
        }
    }
}

#Preview("Formatter Example") {
    FormatterExampleView()
}
