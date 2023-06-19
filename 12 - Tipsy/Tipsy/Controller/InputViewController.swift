//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    var buttons : [String : UIButton]!
    var bill : Float?
    var tipPercent :  Float {
        let selectedTitle : String = buttons.first { (key: String, value: UIButton)  in
            value.isEnabled
        }!.value.currentTitle!
        return Float(selectedTitle.replacingOccurrences(of: "%", with: ""))!/100.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [
            "0%": zeroPcButton,
            "10%": tenPcButton,
            "20%": twentyPcButton,
        ]
        onBillChanged(nil)
    }
    
    @IBAction func onBillChanged(_ sender: UITextField?) {
        bill = Float(sender?.text ?? "")
        billTextField.textColor = bill == nil ? #colorLiteral(red: 0.6901960784, green: 0.2777449177, blue: 0.4093297603, alpha: 1) : #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        calculateButton.backgroundColor = billTextField.textColor
        calculateButton.isEnabled = bill != nil
    }
    
    @IBAction func onTipChanged(_ sender: UIButton) {
        buttons.forEach { (k,v) in
            v.isSelected = sender.titleLabel == v.titleLabel
        }
    }
    
    @IBAction func onSplitChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.f", splitStepper.value)
    }
    
    
    @IBAction func onCalculateClick(_ sender: Any) {
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        (segue.destination as! ResultViewController).tipModel = TipModel(
            percent: tipPercent,
            bill: bill!,
            splitCount: Int(splitStepper.value)
        )
        
    }
    
}
