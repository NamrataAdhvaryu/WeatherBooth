//
//  API+Extensions.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import Foundation


extension API {
 
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLfor(lat:Double,Lon:Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(Lon)&exclude=minutely&appid=\(API_KEY)&units=imperial"
    }
}
