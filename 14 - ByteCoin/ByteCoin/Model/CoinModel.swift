//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Sthefano Schiavon on 19/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let assetIdBase : String
    let assetIdQuote : String
    let rate : Double
    
    var rateFormatted : String {
        return String(format: "%.2f", rate)
    }
}
