//
//  Colors.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

// MARK: - Semantic Color System
extension Color {
    
    // MARK: - Price Change Colors
    /// Color for positive price changes (increase)
    static let priceIncrease = Color.green
    
    /// Color for negative price changes (decrease)
    static let priceDecrease = Color.red
    
    /// Color for neutral/no change
    static let priceNeutral = Color.gray
    
    // MARK: - Crypto-Specific Colors
    /// Primary accent color for crypto app
    static let cryptoAccent = Color.orange
    
    /// Secondary crypto color
    static let cryptoSecondary = Color.blue
    
    // MARK: - Status Colors
    /// Success state color
    static let success = Color.green
    
    /// Error state color
    static let error = Color.red
    
    /// Warning state color
    static let warning = Color.orange
    
    /// Info state color
    static let info = Color.blue
    
    // MARK: - Surface Colors
    /// Primary surface/background
    static let surface = Color(.systemBackground)
    
    /// Elevated surface (cards, modals)
    static let elevatedSurface = Color(.secondarySystemBackground)
    
    /// Tertiary surface
    static let tertiarySurface = Color(.tertiarySystemBackground)
    
    // MARK: - Text Colors
    /// Primary text color
    static let textPrimary = Color.primary
    
    /// Secondary text color (less emphasis)
    static let textSecondary = Color.secondary
    
    /// Tertiary text color (minimal emphasis)
    static let textTertiary = Color(.tertiaryLabel)
    
    // MARK: - Border & Divider
    /// Standard border color
    static let border = Color(.separator)
    
    /// Divider color
    static let divider = Color(.separator)
}

// MARK: - Legacy Support (Deprecated - use Color extensions above)
@available(*, deprecated, message: "Use Color extension properties instead (e.g., Color.priceIncrease)")
struct Colors {
    static let primary = Color.blue
    static let secondary = Color.green
    static let accent = Color.orange
    static let success = Color.green
    static let warning = Color.orange
    static let error = Color.red
}

// MARK: - Preview
#Preview("Color Palette") {
    ScrollView {
        VStack(spacing: Spacing.large) {
            Text("Semantic Color System")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            // Price Colors
            ColorSection(title: "Price Changes") {
                ColorCard(name: "Increase", color: .priceIncrease)
                ColorCard(name: "Decrease", color: .priceDecrease)
                ColorCard(name: "Neutral", color: .priceNeutral)
            }
            
            // Crypto Colors
            ColorSection(title: "Crypto Branding") {
                ColorCard(name: "Accent", color: .cryptoAccent)
                ColorCard(name: "Secondary", color: .cryptoSecondary)
            }
            
            // Status Colors
            ColorSection(title: "Status") {
                ColorCard(name: "Success", color: .success)
                ColorCard(name: "Error", color: .error)
                ColorCard(name: "Warning", color: .warning)
                ColorCard(name: "Info", color: .info)
            }
            
            // Surface Colors
            ColorSection(title: "Surfaces") {
                ColorCard(name: "Surface", color: .surface)
                ColorCard(name: "Elevated", color: .elevatedSurface)
                ColorCard(name: "Tertiary", color: .tertiarySurface)
            }
        }
        .padding()
    }
}

struct ColorSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.small) {
            Text(title)
                .font(.headline)
                .padding(.leading, Spacing.xSmall)
            
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 100))],
                spacing: Spacing.medium
            ) {
                content
            }
        }
    }
}

struct ColorCard: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: Spacing.small) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.border, lineWidth: 1)
                )
            
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.textSecondary)
        }
    }
}
