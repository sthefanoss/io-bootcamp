//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sthefano Schiavon on 15/06/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMICalculator {
    private var height_: Float = 0
    private var weight_: Float = 0
    private var bmi_: BMI!
    
    // 0 <= t <= 1 ; 0.4 <= height <= 2.2
    // 0 <= t <= 1 ; 20 <= weight <= 200
    mutating func setValues(parametrizedHeight :Float, parametrizedWeight : Float) {
        height_ =  0.4 + parametrizedHeight * 1.8
        weight_ = 20 + parametrizedWeight * 180
        bmi_ = BMICalculator.evalBMI(height_, weight_)
    }
    
    
    var height: Float { return height_ }
    
    var weight: Float { return weight_ }
    
    var heightFormatted : String { return String(format: "%.2f m", height_) }
    
    var weightFormatted : String { return String(format: "%.0f kg", weight_) }
    
    var bmi: BMI {
        return bmi_
    }
    
    static private func evalBMI(_ height : Float,_ weight: Float) -> BMI {
        let bmiValue = weight / pow(height, 2)
        let advice : String!
        let color : UIColor!
        
        if (bmiValue < 18.5) {
            advice = "Eat more pies!"
            color = .blue
        } else if (bmiValue < 24.9)  {
            advice = "Fit as a fiddle!"
            color = .green
        } else {
            advice = "Eat less pies!"
            color = .purple
        }
        
        return BMI(
            value: bmiValue,
            valueFormatted: String(format: "%.2f m", bmiValue),
            advice: advice,
            color: color
        )
    }
}
