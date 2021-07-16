//
//  BGAAPIResponse.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
struct BGAPIResponse {
    
    let data: Data
    var statusCode:Int = -100
    
    init(data: Data) {
        self.data = data
    }
    
    func getModel<T:Codable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self.data)
    }
}
