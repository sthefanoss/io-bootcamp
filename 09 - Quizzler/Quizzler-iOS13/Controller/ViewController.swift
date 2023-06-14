//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
   
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizManager = QuizManager()
    var onClickEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIForNextQuestion()
    }

    func updateUIForNextQuestion() {
        progressBar.progress = quizManager.percentage
        if(quizManager.isComplete) {
            textLabel.text = "You finished!\nYour score is \(quizManager.score) out of 100."
            onClickEnabled = false
            return
        }
        onClickEnabled = true
        textLabel.text = quizManager.currentQuestion?.text
    }
    
    func updateUIForUserRespose (answer: Bool, result: Bool, then : @escaping ()->()) {
        let button = answer ? trueButton : falseButton
        let previousBackgroundColor = button?.backgroundColor
        button?.backgroundColor = result ? UIColor.green : UIColor.red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            button?.backgroundColor = previousBackgroundColor
            then()
        }
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        if(!onClickEnabled) { return }
        onClickEnabled = false
        let userAnswer = sender.currentTitle == "True"
        let result = quizManager.checkAnswer(answer: userAnswer)!
        updateUIForUserRespose(
            answer: userAnswer,
            result: result,
            then: updateUIForNextQuestion
        )
    }
}

