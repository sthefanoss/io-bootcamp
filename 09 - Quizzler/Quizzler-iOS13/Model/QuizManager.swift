//
//  QuizManager.swift
//  Quizzler-iOS13
//
//  Created by Sthefano Schiavon on 13/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizManager {
    private let items = [
        QuizItem(text: "2+4 = 5", correctAnswer: false),
        QuizItem(text: "2+4 = 6", correctAnswer: true),
        QuizItem(text: "10+4 = 23", correctAnswer: false),
        QuizItem(text: "10+4 = 14", correctAnswer: true),
    ]
    private var index = 0
    private var rightAnswers = 0
    
    var isComplete: Bool {
        return index == items.count
    }
            
    var currentQuestion: QuizItem? {
        if(index == items.count) { return nil }
        return items[index]
    }
    
    var percentage: Float {
        return Float(1 + index)/Float(1 + items.count)
    }
    
    var score: Int {
        return  Int(100*Float(rightAnswers)/Float(items.count))
    }
    
    mutating func checkAnswer(answer: Bool) -> Bool? {
        let currentQuestion = currentQuestion
        if(currentQuestion == nil) { return nil }
        index += 1
        if(currentQuestion!.correctAnswer == answer) {
            rightAnswers += 1
            return true
        }
        return false
    }
    
}
