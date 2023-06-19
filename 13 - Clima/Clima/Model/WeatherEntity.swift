//
//  WeatherEntity.swift
//  Clima
//
//  Created by Sthefano Schiavon on 19/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherEntity {
    let cityName : String
    let conditionId : Int
    let temperatureInC : Double
    
    var condition : String {
        switch conditionId {
        case 200...232: return "cloud.bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 701...781: return "cloud.fog"
        case 800: return  "sun.max"
        case 801...804: return "cloud.bolt"
        default: return "cloud"
        }
    }
}
