//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//

import Foundation

@Observable
class CoinDetailViewModel {
    var coinDetail: CoinDetail?
    var isLoading = false
    var errorMessage: String? = nil
    
    private let service: CryptoService
    
    init(service: CryptoService = CryptoService()) {
        self.service = service
    }
    
    func fetchCoinDetail(id: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            coinDetail = try await service.fetchCoinDetail(id: id)
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "An unexpected error occurred"
        }
    }
}

