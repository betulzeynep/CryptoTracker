# 📱 CryptoTracker

A modern iOS cryptocurrency tracking application built with SwiftUI, following MVVM architecture and protocol-oriented programming principles.

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2017+-blue.svg)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-green.svg)

## ✨ Features

- **Real-time Crypto Prices**: Track top cryptocurrencies with live price updates
- **Detailed Information**: View comprehensive details including market cap, volume, and price changes
- **Price Charts**: Visualize historical price data with interactive candlestick charts
- **Clean Architecture**: MVVM pattern with clear separation of concerns
- **Protocol-Oriented**: Dependency injection for testability and flexibility
- **Modern Swift**: Async/await, @Observable, and Swift Concurrency

## 🏗️ Architecture

### MVVM Pattern

```
┌─────────────┐      ┌──────────────┐      ┌─────────┐
│    View     │ ────▶│  ViewModel   │ ────▶│ Service │
│  (SwiftUI)  │◀──── │ (@Observable)│◀──── │  Layer  │
└─────────────┘      └──────────────┘      └─────────┘
                            │                     │
                            │                     ▼
                            │              ┌──────────────┐
                            │              │   Network    │
                            └─────────────▶│   Manager    │
                                          └──────────────┘
```

### Layer Responsibilities

| Layer | Responsibility | Example |
|-------|---------------|---------|
| **View** | UI presentation only | `CryptoListView`, `CryptoRow` |
| **ViewModel** | Business logic & state management | `CryptoListViewModel` |
| **Service** | Data operations & transformations | `CryptoService` |
| **Network** | API communication | `NetworkManager` |
| **Model** | Data structures | `CryptoCurrency`, `OHLC` |

## 📁 Project Structure

```
CryptoTracker/
├── App/
│   └── CryptoTrackerApp.swift
├── Models/
│   └── Domain/
│       ├── CryptoCurrency.swift
│       ├── CoinDetail.swift
│       └── OHLC.swift
├── ViewModels/
│   ├── CryptoListViewModel.swift
│   └── CoinDetailViewModel.swift
├── Views/
│   ├── CryptoList/
│   │   ├── CryptoListView.swift
│   │   └── CryptoRow.swift
│   └── CoinDetail/
│       └── CoinDetailView.swift
├── Services/
│   └── CryptoService.swift
└── Networking/
    ├── NetworkManager.swift
    ├── NetworkError.swift
    └── Endpoints/
        └── CoinGeckoEndpoint.swift
```

## 🔧 Technologies & Frameworks

- **SwiftUI**: Declarative UI framework
- **Swift Concurrency**: async/await for asynchronous operations
- **Observation Framework**: @Observable for reactive state management
- **Swift Charts**: Native chart visualizations
- **URLSession**: Network requests
- **Codable**: JSON parsing and serialization

## 🚀 Getting Started

### Prerequisites

- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/CryptoTracker.git
cd CryptoTracker
```

2. Open the project in Xcode:
```bash
open CryptoTracker.xcodeproj
```

3. Build and run the project (⌘ + R)

### API Configuration

This app uses the [CoinGecko API](https://www.coingecko.com/api/documentation) for cryptocurrency data.

**Endpoints used:**
- `/coins/markets` - List of cryptocurrencies with market data
- `/coins/{id}` - Detailed coin information
- `/coins/{id}/ohlc` - Historical price data (OHLC)

*Note: No API key required for basic usage.*

## 💡 Key Design Patterns

### 1. Protocol-Oriented Programming

```swift
protocol NetworkManagerProtocol {
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T
}
```

**Benefits:**
- Easy to mock for testing
- Swap implementations without changing code
- Follows Dependency Inversion Principle

### 2. Dependency Injection

```swift
class CryptoListViewModel {
    private let service: CryptoService
    
    init(service: CryptoService = CryptoService()) {
        self.service = service
    }
}
```

**Benefits:**
- Testable (inject mocks)
- Flexible (swap implementations)
- Loosely coupled

### 3. Separation of Concerns

```swift
// ✅ Model handles formatting
extension CryptoCurrency {
    var formattedPrice: String {
        currentPrice.formatted(.currency(code: "USD"))
    }
}

// ✅ View only displays
Text(crypto.formattedPrice)
```

## 🧪 Testing

### Unit Testing Example

```swift
import Testing
@testable import CryptoTracker

@Suite("CryptoCurrency Formatting Tests")
struct CryptoCurrencyTests {
    
    @Test("Price formats correctly")
    func testPriceFormatting() {
        let crypto = CryptoCurrency.sample
        #expect(crypto.formattedPrice.contains("$"))
    }
    
    @Test("Price increasing logic")
    func testPriceIncreasing() {
        let crypto = CryptoCurrency.sample
        #expect(crypto.isPriceIncreasing == true)
    }
}
```

### Running Tests

```bash
# Command line
xcodebuild test -scheme CryptoTracker -destination 'platform=iOS Simulator,name=iPhone 15'

# Or in Xcode: ⌘ + U
```

## 📚 Code Examples

### Fetching Cryptocurrency Data

```swift
// In ViewModel
func fetchCryptos() async {
    isLoading = true
    do {
        cryptos = try await service.fetchTopCryptos(limit: 50)
    } catch let error as NetworkError {
        errorMessage = error.errorDescription
    }
    isLoading = false
}

// In View
.task {
    await viewModel.fetchCryptos()
}
```

### Error Handling

```swift
enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingError(Error)
    case httpError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        // ...
        }
    }
}
```

## 🎯 Development Roadmap

### ✅ Completed
- [x] Basic app structure with MVVM
- [x] CoinGecko API integration
- [x] Cryptocurrency list view
- [x] Navigation to detail view
- [x] Error handling and loading states
- [x] Formatted price and change display

### 🚧 In Progress
- [ ] Extract formatting logic to model layer
- [ ] Create design system for constants
- [ ] Implement detail view with charts
- [ ] Add OHLC candlestick visualization

### 📋 Planned Features
- [ ] Search functionality
- [ ] Favorites/Watchlist
- [ ] Price alerts
- [ ] Multiple currency support
- [ ] Pull-to-refresh
- [ ] Offline caching
- [ ] Widget support
- [ ] Dark mode customization

## 🎓 Learning Resources

### Architecture & Patterns
- [Swift.org - Language Guide](https://docs.swift.org/swift-book/)
- [Apple - SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)
- [MVVM Design Pattern](https://www.swiftbysundell.com/basics/mvvm/)

### Modern Swift Features
- [Meet async/await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/)
- [Discover Observation Framework](https://developer.apple.com/videos/play/wwdc2023/10149/)
- [Swift Charts](https://developer.apple.com/documentation/charts)

### Testing
- [Swift Testing Framework](https://developer.apple.com/documentation/testing)
- [Testing in Xcode](https://developer.apple.com/videos/play/wwdc2023/10175/)

## 🤝 Contributing

Contributions are welcome! This is a learning project focused on:
- Clean architecture principles
- MVVM pattern
- Protocol-oriented programming
- Modern Swift features
- Best practices in iOS development

### How to Contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Standards

- Follow Swift API Design Guidelines
- Write self-documenting code
- Add comments for complex logic
- Include unit tests for new features
- Maintain separation of concerns

## 📝 Technical Interview Prep

This project demonstrates knowledge of:

**Architecture & Design**
- MVVM pattern implementation
- Protocol-oriented programming
- Dependency injection
- Separation of concerns
- SOLID principles

**Swift Language**
- Generics and type constraints
- Async/await concurrency
- Error handling
- Codable and JSON parsing
- Value types vs reference types

**iOS Development**
- SwiftUI declarative UI
- Navigation patterns
- State management with @Observable
- Network requests with URLSession
- List performance optimization

**Best Practices**
- Code organization and file structure
- Reusable components
- Testable architecture
- Error handling strategies
- Documentation

## 📄 License

This project is created for educational purposes.

**Built with ❤️ using Swift and SwiftUI**

*Last updated: April 2, 2026*
