//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct QuizItem {
    let text: String
    let answer : Bool
}

class ViewController: UIViewController {
    let quizes = [
        QuizItem(text: "2+4 = 5", answer: false),
        QuizItem(text: "2+4 = 6", answer: true),
        QuizItem(text: "10+4 = 23", answer: false),
        QuizItem(text: "10+4 = 14", answer: true),
    ]
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var index = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion(0)
    }

    func setQuestion(_ index: Int) {
        self.index = index
        if(index < quizes.count) {
            questionLabel.text = quizes[index].text } else {
                trueButton.layer.opacity = 0
                trueButton.isEnabled = false
                falseButton.layer.opacity = 0
                falseButton.isEnabled = false
                questionLabel.text = "You finish! Score \(100 * Float(rightAnswers)/Float(quizes.count))"
            }
        progressBar.progress = Float(index + 1)/Float(quizes.count + 1)
    }
    
    @IBAction func onTrueClick(_ sender: UIButton) {
        if(quizes[index].answer) { rightAnswers += 1 }
        setQuestion(index+1)
    }
    
    
    @IBAction func onFalseClick(_ sender: UIButton) {
        if(!quizes[index].answer) { rightAnswers += 1 }
        setQuestion(index+1)
    }
    
}

