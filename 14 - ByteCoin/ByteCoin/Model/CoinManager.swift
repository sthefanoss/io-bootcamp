//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(value: CoinModel)
    func didFailWithError(error: Error?)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "Coin Api Key") as! String
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let url = URL(string:"\(baseURL)/\(currency)?apikey=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error != nil || data == nil {
                self.delegate?.didFailWithError(error: error)
                return
            }
            
            do {
                let coinData = try JSONDecoder().decode(CoinData.self, from: data!)
                let model = CoinModel(
                    assetIdBase: coinData.assetIdBase,
                    assetIdQuote: coinData.assetIdQuote,
                    rate: coinData.rate
                )
                
                self.delegate?.didUpdatePrice(value: model)
            } catch let error {
                self.delegate?.didFailWithError(error: error)
            }
        }
        
        
        task.resume()
        
    }
}
