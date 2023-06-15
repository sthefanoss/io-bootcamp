//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sthefano Schiavon on 15/06/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var calculatorBrain : BMICalculator!
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = calculatorBrain.bmi.color
        bmiLabel.text = calculatorBrain.bmi.valueFormatted
        adviceLabel.text = calculatorBrain.bmi.advice
    }
    
    @IBAction func onRecalculateButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
