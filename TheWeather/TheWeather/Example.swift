//
//  Example.swift
//  TheWeather
//
//  Created by Nutnutcha Hanggitthagul on 22/2/2566 BE.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var convertButton: UIButton!
    
    var isCelsius = true
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up initial state of UI elements
        convertButton.setTitle("Convert to Fahrenheit", for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        if isCelsius {
            // Convert to Fahrenheit
            temperatureLabel.text = convertToDegreesFahrenheit(temperatureLabel.text!)
            convertButton.setTitle("Convert to Celsius", for: .normal)
        } else {
            // Convert to Celsius
            temperatureLabel.text = convertToDegreesCelsius(temperatureLabel.text!)
            convertButton.setTitle("Convert to Fahrenheit", for: .normal)
        }
        isCelsius = !isCelsius
    }
    
    // MARK: - Helper Methods
    
    func convertToDegreesCelsius(_ degreesFahrenheit: String) -> String {
        guard let fahrenheit = Double(degreesFahrenheit) else {
            return degreesFahrenheit
        }
        let celsius = (fahrenheit - 32) * 5 / 9
        return String(format: "%.0f°C", celsius)
    }
    
    func convertToDegreesFahrenheit(_ degreesCelsius: String) -> String {
        guard let celsius = Double(degreesCelsius) else {
            return degreesCelsius
        }
        let fahrenheit = celsius * 9 / 5 + 32
        return String(format: "%.0f°F", fahrenheit)
    }
}

// Make a request to fetch the current weather data for a given city
//func fetchCurrentWeather(for city: String, completion: @escaping (WeatherData?, Error?) -> Void) {
//    let apiKey = "YOUR_API_KEY"
//    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)")!
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            completion(nil, error)
//            return
//        }
//        do {
//            let decoder = JSONDecoder()
//            let weatherData = try decoder.decode(WeatherData.self, from: data)
//            completion(weatherData, nil)
//        } catch {
//            completion(nil, error)
//        }
//    }
//    task.resume()
//}
//
//// Make a request to fetch the 5-day forecast data for a given city
//func fetchForecast(for city: String, completion: @escaping ([ForecastData]?, Error?) -> Void) {
//    let apiKey = "YOUR_API_KEY"
//    let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)")!
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            completion(nil, error)
//            return
//        }
//        do {
//            let decoder = JSONDecoder()
//            let forecastData = try decoder.decode(ForecastResponse.self, from: data)
//            completion(forecastData.list, nil)
//        } catch {
//            completion(nil, error)
//        }
//    }
//    task.resume()
//}
