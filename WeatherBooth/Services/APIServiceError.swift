//
//  APIServiceError.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
enum APIServiceError: Error {
    case responseError
    case networkError
    case parseError(Error)
    case locationNotFound
    
    var localizedDescription: String {
        switch self {
        case .responseError: return "network error"
        case .parseError: return "Invalid response from server, error in typing."
        case .networkError: return "Network is not available, please try again later."
        case .locationNotFound: return "Your current location not found."
        }
    }
}

