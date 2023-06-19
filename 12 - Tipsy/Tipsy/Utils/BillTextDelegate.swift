//
//  BillTextDelegate.swift
//  Tipsy
//
//  Created by Sthefano Schiavon on 15/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

public extension String {
    subscript(_ idx: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: idx)]
    }
    
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence {
        guard bounds.lowerBound <= self.count else {
            return SubSequence("")
        }
        
        guard bounds.upperBound <= self.count else {
            let start = index(startIndex, offsetBy: bounds.lowerBound)
            return self[start..<self.endIndex]
        }
        
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
    
    subscript(bounds: CountableRange<Int>) -> SubSequence {
        guard bounds.lowerBound <= self.count else {
            return SubSequence("")
        }
        
        guard bounds.upperBound <= self.count else {
            let start = index(startIndex, offsetBy: bounds.lowerBound)
            return self[start..<self.endIndex]
        }
        
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
}


class BillTextDelegate : NSObject, UITextFieldDelegate {
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string.isEmpty) {
            return true
        }
        
        let oldtext = (textField.text ?? "").components(separatedBy: ".").joined()
        let newText : String = String(oldtext[0..<range.location]) + string + String(oldtext[range.location..<oldtext.count])
        if(matches(for: "^[0-9]+$", in: newText).isEmpty){
            return false
        }
        
        var cursorPosition : Int?
        if let selectedRange = textField.selectedTextRange {
            cursorPosition = textField.offset(from: textField.beginningOfDocument, to: selectedRange.start)
        }

        textField.text = newText.count > 2 ? newText[0..<newText.count-2] + "." + newText[newText.count-2..<newText.count]: newText
        
        let increment = oldtext.count < 2 && newText.count==2 ? 2 : 1
        if let newPosition = textField.position(from: textField.beginningOfDocument, offset: cursorPosition!+increment) {

            textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
        }
        return false;
    }
}


func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

