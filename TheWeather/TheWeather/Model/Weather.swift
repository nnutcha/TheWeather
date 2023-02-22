//
//  Weather.swift
//  TheWeather
//
//  Created by Nutnutcha Hanggitthagul on 22/2/2566 BE.
//

import Foundation

struct Weather: Codable {
    let name: String
    let main: Main
    let weather: [WeatherDescription]
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherList: Codable {
    let weather: [Weather]
}
