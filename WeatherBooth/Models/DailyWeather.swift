//
//  DailyWeather.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var weather: [WeatherDetail]
    var temp: Temperature
    
enum codingkey:String {
        case dt
        case weather
        case temp
    }
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
    
}
extension DailyWeather {
    var id:UUID {
     return UUID()
    }
    
}
