//
//  CryptoImageView.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 2.04.2026.
//

import SwiftUI

/// Displays cryptocurrency icon with loading and error states
/// Reusable component for showing crypto images throughout the app
struct CryptoImageView: View {
    let imageURL: String
    let size: CGFloat
    
    /// Initialize with custom size
    init(imageURL: String, size: CGFloat = ImageSizes.cryptoIcon) {
        self.imageURL = imageURL
        self.size = size
    }
    
    /// Convenience initializer that takes the whole crypto object
    init(crypto: CryptoCurrency, size: CGFloat = ImageSizes.cryptoIcon) {
        self.imageURL = crypto.image
        self.size = size
    }
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: Icons.cryptoPlaceholder)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.cryptoAccent)
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}

// MARK: - Previews
#Preview("Default Size") {
    CryptoImageView(crypto: CryptoCurrency.sample)
}

#Preview("Different Sizes") {
    VStack(spacing: Spacing.large) {
        CryptoImageView(crypto: CryptoCurrency.sample, size: ImageSizes.cryptoIconSmall)
        CryptoImageView(crypto: CryptoCurrency.sample, size: ImageSizes.cryptoIcon)
        CryptoImageView(crypto: CryptoCurrency.sample, size: ImageSizes.cryptoIconLarge)
    }
}

#Preview("Error State") {
    CryptoImageView(imageURL: "invalid-url")
}
