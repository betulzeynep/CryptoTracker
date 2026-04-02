//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 31.03.2026.
//

import Foundation

@Observable
class CoinDetailViewModel {
    // Coin detail data
    var coinDetail: CoinDetail?
    // OHLC chart data
    var ohlcData: [OHLC]?
    // Loading states
    var isLoadingDetail = false
    var isLoadingOHLC = false
    // Errors
    var errorMessage: String?
    
    private let service: CryptoService
    
    init(service: CryptoService = CryptoService()) {
        self.service = service
    }
    
    func fetchCoinDetail(id: String) async {
        isLoadingDetail = true
        errorMessage = nil
        
        do {
            coinDetail = try await service.fetchCoinDetail(id: id)
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "An unexpected error occurred"
        }
        
        isLoadingDetail = false
    }
    
    func fetchOHLCData(id: String, days: Int = 7) async {
        isLoadingOHLC = true
        errorMessage = nil
        
        do {
            ohlcData = try await service.fetchPriceHistory(id: id, days: days)
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "An unexpected error occurred"
        }
        
        isLoadingOHLC = false
    }
}

