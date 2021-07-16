//
//  WeatherRequestt.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
struct WeatherRequestt: APIRequestType {
    
    typealias Response = WeatherData
    
    var queryParams: [String : String]
    
    init(_ params: [String: String]) {
        queryParams = params
    }
    var path: String { return "/data/2.5/onecall" }
    var queryItems: [URLQueryItem]? {
        return queryParams.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }
}
