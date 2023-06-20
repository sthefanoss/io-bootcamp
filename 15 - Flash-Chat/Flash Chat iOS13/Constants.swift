//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Sthefano Schiavon on 20/06/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct Constants {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    struct Segue {
        static let register = "RegisterToChat"
        static let login = "LoginToChat"
    }
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "text"
        static let dateField = "time"
        
    }
}
