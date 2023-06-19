//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        inputTextField.delegate = self
        locationManager.delegate = self
    }
}

//MARK: - UITextFieldDelegate Extension

extension WeatherViewController : UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        inputTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return (textField.text?.count ?? 0) > 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherManager.fetch(cityName: inputTextField.text ?? "")
        inputTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate Extension

extension WeatherViewController : WeatherManagerDelegate {
    func didChangeWeather(value: WeatherEntity) {
        DispatchQueue.main.async {
            self.cityLabel.text = value.cityName
            self.temperatureLabel.text = String(format: "%.0f", value.temperatureInC)
            self.conditionImageView.image = UIImage(systemName: value.condition)
        }
    }
    
    func didFailed(error: Any?) {
        print(error ?? "")
    }
}

//MARK: - CLLocationManagerDelegate Extension

extension WeatherViewController : CLLocationManagerDelegate {
    @IBAction func locatePressed(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        weatherManager.fetch(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
