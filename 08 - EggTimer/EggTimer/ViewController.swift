//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    let timesInMinutes = [
        "Soft" : 5,
        "Medium" : 7,
        "Hard": 12,
    ]
    var secondsRemaining = 0
    var timer: Timer?
    var currentTimer: Int = 0

    @IBAction func onPressed(_ sender: UIButton) {
        schedule(sender.currentTitle!)
    }
    
    func schedule(_ hardness: String) {
        currentTimer = timesInMinutes[hardness]! * 1
        secondsRemaining = currentTimer
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer() {
        if(secondsRemaining > 0) {
            print("\(secondsRemaining) seconds")
            secondsRemaining-=1;
        } else {
            timer?.invalidate()
            timer = nil
        }
        progressBar.progress = 1 - Float(secondsRemaining)/Float(currentTimer)
    }
}
