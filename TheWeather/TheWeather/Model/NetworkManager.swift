//
//  NetworkManager.swift
//  TheWeather
//
//  Created by Nutnutcha Hanggitthagul on 22/2/2566 BE.
//

import Foundation

class NetworkManager {
    static func getCurrentWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
            let urlString = "\(APIConstants.baseURL)/weather?q=\(city)&appid=\(APIConstants.apiKey)"
            guard let url = URL(string: urlString) else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                do {
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(weather))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    
    static func getFiveDayForecast(for city: String, completion: @escaping (Result<[Weather], Error>) -> Void) {
            let urlString = "\(APIConstants.baseURL)/forecast?q=\(city)&appid=\(APIConstants.apiKey)"
            guard let url = URL(string: urlString) else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                do {
                    let weatherList = try JSONDecoder().decode(WeatherList.self, from: data)
                    completion(.success(weatherList.weather))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
