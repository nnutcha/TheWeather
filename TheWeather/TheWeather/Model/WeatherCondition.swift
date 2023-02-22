//
//  WeatherCondition.swift
//  TheWeather
//
//  Created by Nutnutcha Hanggitthagul on 22/2/2566 BE.
//

import Foundation

enum WeatherCondition {
    case clearSky
    case fewClouds
    case scatteredClouds
    case brokenClouds
    case showerRain
    case rain
    case thunderstorm
    case snow
    case mist
    
    init(code: Int) {
        switch code {
        case 800:
            self = .clearSky
        case 801...804:
            self = .fewClouds
        case 805...899:
            self = .scatteredClouds
        case 951...959:
            self = .brokenClouds
        case 300...399:
            self = .showerRain
        case 500...531:
            self = .rain
        case 200...232:
            self = .thunderstorm
        case 600...622:
            self = .snow
        case 701...781:
            self = .mist
        default:
            self = .clearSky
        }
    }
    
    var imageName: String {
        switch self {
        case .clearSky:
            return "clear_sky"
        case .fewClouds, .scatteredClouds, .brokenClouds:
            return "cloudy"
        case .showerRain, .rain:
            return "rainy"
        case .thunderstorm:
            return "thunderstorm"
        case .snow:
            return "snowy"
        case .mist:
            return "mist"
        }
    }
}
