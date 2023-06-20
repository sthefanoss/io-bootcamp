//
//  PhoneWidget.swift
//  Card Project
//
//  Created by Sthefano Schiavon on 20/06/23.
//

import SwiftUI

struct PhoneWidget: View {
    let text : String
    let iconPath : String
    
    var body: some View {
        
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height: 50)
                .overlay(HStack {
                    Image(systemName: iconPath)
                        .foregroundColor(Color("Info Color"))
                    Text(text)
                        .foregroundColor(Color("Info Color"))
                        .bold()
                })
        }
    
    }

struct PhoneWidget_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PhoneWidget(text: "Phone", iconPath: "phone")
        }
    }
}
