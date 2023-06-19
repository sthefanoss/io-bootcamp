//
//  File.swift
//  Clima
//
//  Created by Sthefano Schiavon on 19/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didChangeWeather(value : WeatherEntity) -> Void
    func didFailed(error : Any?) -> Void
}

struct WeatherManager {
    private var appid : String {
        return  Bundle.main.object(forInfoDictionaryKey: "Weather appid") as! String
    }
    
    var delegate : WeatherManagerDelegate? = nil
    
    func fetch (lat : Double, lon: Double) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=\(appid)&lat=\(lat)&lon=\(lon)")
        if(url == nil) { return }
        performRequest(url: url!)
    }
    
    func fetch (cityName: String) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=\(appid)&q=\(cityName)")
        if(url == nil) { return }
        performRequest(url: url!)
    }
    
    private func performRequest (url : URL) {
        let task = URLSession.shared.dataTask(with: url) { rawData, response, error in
            if(rawData == nil || error != nil) {
                delegate?.didFailed( error: error)
                return
            }
            
            do {
                let data : WeatherData = try JSONDecoder().decode(WeatherData.self, from: rawData!)
                delegate?.didChangeWeather(value:  WeatherEntity(
                    cityName: data.name,
                    conditionId: data.weather.first!.id,
                    temperatureInC: data.main.temp
                ))
            } catch let error {
                delegate?.didFailed(error: error)
            }
        }
        
        task.resume()
    }
}
