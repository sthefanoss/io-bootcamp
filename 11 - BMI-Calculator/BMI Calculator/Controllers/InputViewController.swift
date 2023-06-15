//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var calculatorBrain = BMICalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSlider.maximumValue = 1
        heightSlider.value = 0.5
        weightSlider.maximumValue = 1
        weightSlider.value = 0.5
        onSliderChanged(nil)
    }
    
    @IBAction func onSliderChanged(_ sender: Any?) {
        calculatorBrain.setValues(
            parametrizedHeight: heightSlider.value,
            parametrizedWeight: weightSlider.value
        )
        
        heightLabel.text = calculatorBrain.heightFormatted
        weightLabel.text = calculatorBrain.weightFormatted
    }
    
    
    @IBAction func onCalculateClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationViewController = segue.destination as! ResultViewController
            destinationViewController.calculatorBrain = calculatorBrain
        }
        
    }
}

