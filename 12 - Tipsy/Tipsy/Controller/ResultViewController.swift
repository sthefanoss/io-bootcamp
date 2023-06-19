//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sthefano Schiavon on 15/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var tipModel : TipModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = tipModel.totalPerPersonFormatted
        descriptionLabel.text = tipModel.description
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func onRecalculateClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
