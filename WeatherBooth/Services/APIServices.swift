//
//  APIServices.swift
//  WeatherBooth
//
//  Created by Namrata Akash on 15/07/21.
//

import Foundation
import Combine

struct Environment {
    static let BASE_URL = "https://api.openweathermap.org"
    static let API_KEY = "e76bdcf79bc5e1c1348f8f67075fa9a9"
}

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryParams: [String: String] { get set }
    var queryItems: [URLQueryItem]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    
    private let baseURL: URL
    init(baseURL: URL = URL(string: Environment.BASE_URL)!) {
        self.baseURL = baseURL
    }

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
    
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decorder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
