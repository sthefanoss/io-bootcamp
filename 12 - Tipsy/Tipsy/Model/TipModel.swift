//
//  TipModel.swift
//  Tipsy
//
//  Created by Sthefano Schiavon on 19/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipModel {
    var percent : Float
    var bill : Float
    var splitCount : Int
    
    var totalPerPerson : Float {
        return (1 + percent)*bill / Float(splitCount)
    }
    
    var totalPerPersonFormatted : String {
        return String(format: "%.2f", totalPerPerson)
    }
    
    var description : String {
        return String(format: "Split between %d people, with %0.f", splitCount, percent  * 100) + "% tip."
    }
}
