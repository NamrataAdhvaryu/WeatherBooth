//
//  WeatherResponses.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
import Combine

// MARK: - Weather
struct WeatherData: Codable {
    let lat, lon: Double
    let timezone: String
    let current: Currentt
    let daily: [Dailyy]
}

// MARK: - Current
struct Currentt: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weatherr]
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Weather
struct Weatherr: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct Dailyy: Codable {
    let dt, sunrise, sunset: Int
    let temp: Tempp
    let feelsLike: FeelsLikee
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [Weatherr]
    let clouds: Int
    let pop, uvi: Double
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLikee: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Tempp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

class AppSettings: ObservableObject {
    @Published var units = "C"
    @Published var lat = 25.2048
    @Published var lon = 55.2708
}
