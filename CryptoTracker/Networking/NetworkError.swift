//
//  NetworkError.swift
//  CryptoTracker
//
//  Created by Zeynep Turnalı on 30.03.2026.
//

import Foundation

enum NetworkError: Error {
    // Foundation errors
    case invalidURL
    case noData
    case invalidResponse
    case unknown(Error?)
    
    // Network errors
    case noInternetConnection
    case timeout
    
    // HTTP errors
    case badRequest              // 400
    case unauthorized            // 401
    case forbidden               // 403
    case notFound                // 404
    case tooManyRequests         // 429
    case internalServerError     // 500
    case serviceUnavailable      // 503
    
    // CoinGecko specific
    case accessDenied
    case accessDeniedPro
    case missingAPIKey
    case invalidAPIKey
    
    // Parsing errors
    case decodingError(Error)    // ← Associated value with underlying error!
}

// MARK: - URLError Mapping
extension NetworkError {
    /// Maps URLError to NetworkError for consistent error handling
    static func from(urlError: URLError) -> NetworkError {
        switch urlError.code {
        case .notConnectedToInternet, .networkConnectionLost:
            return .noInternetConnection
        case .timedOut:
            return .timeout
        case .badURL:
            return .invalidURL
        case .cannotFindHost, .cannotConnectToHost:
            return .serviceUnavailable
        default:
            return .unknown(urlError)
        }
    }
}

// MARK: - LocalizedError Conformance
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "This is due to an invalid request and the server could not process the user’s request"
        case .unauthorized:
            return "This is due to the lack of valid authentication credentials for the requested resource by the user"
        case .forbidden:
            return "This is likely indicating that your access is blocked by our server, and we’re unable to authorize your request"
        case .notFound:
            return "The requested resource could not be found. The cryptocurrency may not exist or the endpoint has changed."
        case .timeout:
            return "This error indicates that our server did not receive your complete request within our allowed time frame. This is usually caused by a slow network connection on your end or network latency. Please check your connection and try sending the request again."
        case .tooManyRequests:
            return "This is likely indicating that the rate limit has been reached. The user should reduce the number of calls made, or consider scaling their service plan that has much higher rate limits and call credits"
        case .internalServerError:
            return "This is a generic error response indicating that the server has encountered an unexpected issue that prevented it from fulfilling the request"
        case .serviceUnavailable:
            return "The service is currently unavailable. Please check the API status and updates on https://status.coingecko.com"
        case .accessDenied:
            return "This is due to violation of CDN firewall rule"
        case .accessDeniedPro:
            return "You may not have access to this endpoint. e.g. ‘This request is limited to Pro API subscribers’. You may want to subscribe to a paid plan here"
        case .missingAPIKey:
            return "API Key Missing. Please make sure you’re using the right authentication method. For Demo API, ensure you pass in x_cg_demo_api_key parameter with a Demo Key."
        case .invalidAPIKey:
            return "You have provided incorrect API key credentials. If you are using Pro API key, please change your root URL from api.coingecko.com to pro-api.coingecko.com"
        case .noInternetConnection:
            return "No internet connection available. Please check your network settings and try again."
        case .decodingError(let error):
            return "Unable to process the response from the server. \(error.localizedDescription)"
        case .invalidURL:
            return "The web address is malformed or invalid. Please contact support if this persists."
        case .noData:
            return "The server returned an empty response. Please try again."
        case .invalidResponse:
            return "The server returned an unexpected response format."
        case .unknown(let error):
            return "An unexpected error occurred: \(error?.localizedDescription ?? "Unknown error")"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidURL:
            return "Please update to the latest version of the app. If the problem persists, contact support."
        case .noData:
            return "Try refreshing the page or check back in a few moments."
        case .invalidResponse:
            return "Please ensure you're using the latest version of the app."
        case .noInternetConnection:
            return "Check your WiFi or cellular connection and try again."
        case .timeout:
            return "Check your internet connection. If it's stable, try again in a moment."
        case .badRequest:
            return "Please try again. If this continues, the app may need an update."
        case .unauthorized:
            return "Please check your authentication settings or re-login to the app."
        case .forbidden:
            return "If you believe this is an error, please contact support with your account details."
        case .notFound:
            return "Try searching for a different cryptocurrency or refresh the list."
        case .tooManyRequests:
            return "Wait a few minutes before trying again, or consider upgrading your API plan."
        case .internalServerError:
            return "This is a temporary server issue. Please try again in a few minutes."
        case .serviceUnavailable:
            return "Visit https://status.coingecko.com for service status updates or try again later."
        case .accessDenied:
            return "If you're using a VPN, try disabling it. Otherwise, contact support."
        case .accessDeniedPro:
            return "Visit https://www.coingecko.com/en/api/pricing to upgrade your API access."
        case .missingAPIKey:
            return "Check your API key configuration in the app settings."
        case .invalidAPIKey:
            return "Verify your API key is correct and update your base URL to pro-api.coingecko.com if using a Pro key."
        case .decodingError:
            return "This may be fixed by updating to the latest version of the app. The API response format may have changed."
        case .unknown:
            return "Please try again. If the problem continues, contact support with the error details."
        }
    }
}

