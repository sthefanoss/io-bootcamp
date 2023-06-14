//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        storyLabel.text = storyBrain.current.text
        choice1Button.setTitle(storyBrain.current.option0?.0, for: .normal)
        choice2Button.setTitle(storyBrain.current.option1?.0, for: .normal)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        var nextStep: Int?
        switch sender {
        case choice1Button: // option0
            nextStep = storyBrain.current.option0?.1
            break
        case choice2Button: // option1
            nextStep = storyBrain.current.option1?.1
            break
        default:
            break
        }
  
        if (nextStep == nil) { return }
        storyBrain.selectPath(index: nextStep!)
        updateUI()
    }
}

