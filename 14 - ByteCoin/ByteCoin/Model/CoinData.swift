//
//  CoinData.swift
//  ByteCoin
//
//  Created by Sthefano Schiavon on 19/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData : Codable {
    let assetIdBase : String
    let assetIdQuote : String
    let rate : Double
    
    private enum CodingKeys: String, CodingKey {
        case assetIdBase = "asset_id_base"
        case assetIdQuote = "asset_id_quote"
        case rate
    }
}
