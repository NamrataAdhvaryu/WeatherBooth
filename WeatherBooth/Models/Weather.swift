//
//  Weather.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import Foundation

 struct Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feels_like: Double
    var pressure: Int
    var humidity:Int
    var dew_point: Double
    var uvi: Double
    var clouds: Int
    var visibility: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    enum Codingkey : String {
    case dt
    case temp
    case feels_like
    case pressure
    case humidity
    case dew_point
    case uvi
    case clouds
    case visibility
    case wind_speed
    case wind_deg
    case weather
        
    }
    
    init() {
        dt = 0
        temp = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        uvi = 0.0
        clouds = 0
        visibility = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
}

extension Weather {
    var id :UUID {
        return UUID()
    }
    
}

