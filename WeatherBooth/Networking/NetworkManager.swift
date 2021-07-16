//
//  NetworkManager.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 12/07/21.
//

import Foundation

final class Networkmanager<T:Codable> {
    static func fetch(for url:URL , completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
            print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
                
            guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
            guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
                }
            catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
                }
                
                
           
        }.resume()
        
    }
    
    enum NetworkError:Error {
        case invalidData
        case invalidResponse
        case error(err:String)
        case decodingError(err:String)
    }
}
