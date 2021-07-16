//
//  CityViewViewModel.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import SwiftUI
import CoreLocation


final class CityViewViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    
    @Published var city: String = "Montreal" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateformatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    private lazy var dayformatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    private lazy var timeformatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
    getLocation()
    }
   
    var date:String {
        dateformatter.string(from: Date(timeIntervalSince1970:TimeInterval(weather.current.dt)))
    }
    
    var weathericon:String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return ""
    }
    var conditions:String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return "dayClearSky"
    }
    var humidity:String {
        return String(format: "%d%%", weather.current.humidity)
    }
    var windSpeed:String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    var rainChances:String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    var temperature:String {
        return getTemp(temp: weather.current.temp)
    }
    func getTemp(temp:Double) -> String {
        return String(format: "%0.1f", temp)
    }
    func getTimefor(timestep:Int) -> String {
        return timeformatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestep)))
    }
    func getdayfor(timestep:Int) -> String {
        return dayformatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestep)))
    }
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlstring = API.getURLfor(lat: coord.latitude, Lon: coord.longitude)
            getWeatherInternal(city: city, for: urlstring)
        }
        else {
            let urlstring = API.getURLfor(lat:37.5485 , Lon: -121.9886)
            getWeatherInternal(city: city, for: urlstring)
            
        }
    }
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks , let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    private func getWeatherInternal(city:String, for urlstring:String) {
        Networkmanager<WeatherResponse>.fetch(for: URL(string: urlstring)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
                
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    func getWeathericonFor(icon:String) -> Image {
        switch icon {
        
        case "01d":
            return Image(systemName: "sun.max.fill") //clear_sky_day
        case "01n":
            return Image(systemName: "moon.fill") //clear_sky_night
        case "02d":
            return Image(systemName: "cloud.sun.fill") // few_cloud_day
        case "02n":
            return Image(systemName: "cloud.sun.fill") // few_cloud_night
        case "03d":
            return Image(systemName: "cloud.fill") //scattered_cloud
        case "03n":
            return Image(systemName: "cloud.fill") //scattered_cloud
        case "04d":
            return Image(systemName: "cloud.fill") //broken_cloud
        case "04n":
            return Image(systemName: "cloud.fill") //broken_cloud
        case "09d":
            return Image(systemName: "cloud.drizzle.fill") //shower_rain
        case "09n":
            return Image(systemName: "cloud.drizzle.fill") //shower_rain
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill") //rain_day
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill") //rain_night
        case "11d":
            return Image(systemName: "cloud.bolt.fill") //thenderstorm_day
        case "11n":
            return Image(systemName: "cloud.bolt.fill") //thenderstorm_night
        case "13d":
            return Image(systemName: "cloud.snow.fill") //snow
        case "13n":
            return Image(systemName: "cloud.snow.fill") //snow
        case "50d":
            return Image(systemName: "cloud.fog.fill") //mist
        case "50n":
            return Image(systemName: "cloud.fog.fill") //mist
        
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
    func getLottieAnimationFor(icon:String) -> String {
        switch icon {
        
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "dayMist"
            
        default:
            return "dayClearSky"
        }
    }
    
}
