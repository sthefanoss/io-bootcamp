//
//  ContentView.swift
//  Card Project
//
//  Created by Sthefano Schiavon on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea(.all)
            VStack {
                Image("Profile Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke( Color.white, lineWidth:5)
                    )
                Text("Sthefano Schiavon")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(Color.white)
                Text("Flutter | iOS Developer")
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                Divider()
                    .padding(.all)
                PhoneWidget(
                    text: "+55 53 981392334",
                    iconPath: "phone.fill"
                )
                PhoneWidget(
                    text: "sthefanoss@gmail.com",
                    iconPath: "envelope.fill"
                )
            }.padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
