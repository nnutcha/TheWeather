//
//  WeatherViewController.swift
//  TheWeather
//
//  Created by Nutnutcha Hanggitthagul on 22/2/2566 BE.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    var isFahrenheit = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        convertButton.titleLabel?.text = "Convert to Celsius"
    }
    
    @IBAction func getCurrentWeatherButtonTapped(_ sender: UIButton) {
        guard let city = cityTextField.text, !city.isEmpty else {
            return
        }
        NetworkManager.getCurrentWeather(for: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.temperatureLabel.text = "\(weather.main.temp) °F"
                    self.humidityLabel.text = "\(weather.main.humidity) %"
                    
                }
            case .failure(_):
                print("Error getting current weather: (error.localizedDescription)")
                break
            }
        }
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        if !isFahrenheit {
            // Convert to Fahrenheit
            temperatureLabel.text = convertToDegreesFahrenheit(temperatureLabel.text!)
            convertButton.setTitle("Convert to Celsius", for: .normal)
        } else {
            // Convert to Celsius
            temperatureLabel.text = convertToDegreesCelsius(temperatureLabel.text!)
            convertButton.setTitle("Convert to Fahrenheit", for: .normal)
        }
        isFahrenheit = !isFahrenheit
    }
    
    // MARK: - Helper Methods
    
    func convertToDegreesCelsius(_ degreesFahrenheit: String) -> String {
        guard let fahrenheit = Double(degreesFahrenheit) else {
            return degreesFahrenheit
        }
        let celsius = (fahrenheit - 32) * 5 / 9
        return String(format: "%.0f °C", celsius)
    }
    
    func convertToDegreesFahrenheit(_ degreesCelsius: String) -> String {
        guard let celsius = Double(degreesCelsius) else {
            return degreesCelsius
        }
        let fahrenheit = celsius * 9 / 5 + 32
        return String(format: "%.0f °F", fahrenheit)
    }
}
