//
//  ContentView.swift
//  DiceeSwift
//
//  Created by Sthefano Schiavon on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftDice : Int = 1
    @State var rightDice : Int = 2
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("diceeLogo")
                Spacer()
                HStack() {
                    DiceView(face: leftDice)
                    Spacer()
                    DiceView(face: rightDice)
                }.padding(.horizontal, 40.0)
                Spacer()
                Button(action: {
                    leftDice = Int.random(in: 1...6)
                    rightDice = Int.random(in: 1...6)
                }){
                    Text("Roll")
                        .foregroundColor(Color.white)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                }
                .background(Color(red: 0.609, green: 0.11, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView : View {
    let face : Int
    var body: some View {
        Image("dice\(face)")
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(face: 2)
    }
}
