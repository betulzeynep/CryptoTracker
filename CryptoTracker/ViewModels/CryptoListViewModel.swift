//
//  CryptoListViewModel.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

@Observable
class CryptoListViewModel {
    var cryptos: [CryptoCurrency] = []
    var isLoading = false
    var errorMessage: String? = nil
    
    private let service: CryptoService
    
    init(service: CryptoService = CryptoService()) {
        self.service = service
    }
    
    func fetchCryptos() async {
        isLoading = true
        errorMessage = nil
        
        do {
            cryptos = try await service.fetchTopCryptos(limit: 50)
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "An unexpected error occurred"
        }
        
        isLoading = false
    }
}
