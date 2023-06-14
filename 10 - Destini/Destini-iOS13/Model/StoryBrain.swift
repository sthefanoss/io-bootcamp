//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let items = [
        Story(
            text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: Need a ride, boy?",
            option0: ("I'll hop in. Thanks for the help!", 2),
            option1: ("Well, I don't have many options. Better ask him if he's a murderer.", 1)
        ),
        Story(
            text: "He nods slowly, unphased by the question",
            option0: ("At least he's honest. I'll climb in.", 2),
            option1: ("Wait, I know how to change a tire.", 3)
        ),
        Story(
            text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
            option0: ("I love Elton John! Hand him the cassette tape.", 5),
            option1: ("It’s him or me. Take the knife and stab him.", 4)
        ),
        Story(
            text: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?",
            option0: nil,
            option1: nil
        ),
        Story(
            text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            option0: nil,
            option1: nil
        ),
        Story(
            text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"",
            option0: nil,
            option1: nil
        )
    ]
    
    private var currentIndex = 0
    
    var current: Story {
        return items[currentIndex]
    }
    
    mutating func selectPath(index: Int) {
        currentIndex = index
    }
}
