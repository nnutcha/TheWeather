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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            case .failure(let error):
                print("Error getting current weather: (error.localizedDescription)")
                break
            }
        }
    }
}
