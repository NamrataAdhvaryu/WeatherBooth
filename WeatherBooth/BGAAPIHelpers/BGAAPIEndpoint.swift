//
//  BGAAPIEndpoint.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
struct APII {
    static let baseUrl = "http://api.openweathermap.org/"
    static let version = "data/2.5/"
    static let weatherPath = "onecall"
    static let appIdKey = "appid"
    static let appId = "331fc0c7b422365e594b67341c728c82"
}

class BGAPIEndPoint {
    
    var baseUrl: String {
        return APII.baseUrl
    }
    
    var path: String {
        return APII.weatherPath
    }
    
    var params: String {
        return ""
    }
    
    var appid: String {
        return "?\(APII.appIdKey)=\(APII.appId)"
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var apiVersion: String {
        return APII.version
    }
    
    var onlyDaily: String {
        return "&exclude=hourly,minutely"
    }
    
    var url : String {
        return baseUrl + apiVersion + path + appid + onlyDaily + params
    }
}

enum HttpMethod :String {
    case post = "POST"
    case get = "GET"
}
