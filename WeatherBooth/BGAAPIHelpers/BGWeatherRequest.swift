//
//  BGWeatherRequest.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
class BGWeatherRequest: BGAPIEndPoint {
    
    var latitude: Double?
    var longitude: Double?
    
    override var params: String {
        return "&lat=\(latitude ?? 0)&lon=\(longitude ?? 0)"
    }
    
    init(_ latitude: Double, _ longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
