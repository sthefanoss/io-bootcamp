//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let images : [String] = [
     "DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive", "DiceSix"
    ]
    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRollClick(_ sender: Any) {
        diceImageViewOne.image = UIImage(named: images.randomElement()!)
        diceImageViewTwo.image = UIImage(named: images.randomElement()!)
    }
    
}

