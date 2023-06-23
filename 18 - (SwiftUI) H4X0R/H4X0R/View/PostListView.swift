//
//  ContentView.swift
//  H4X0R
//
//  Created by Sthefano Schiavon on 23/06/23.
//

import Foundation
import SwiftUI
import WebKit

struct PostListView: View {
    @ObservedObject   var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {  item in
                NavigationLink(destination: PostView(url: item.url)) {
                    HStack(alignment: .top) {
                        Text(String(item.points))
                            .foregroundColor(Color.accentColor)
                        Text(item.title)
                    }
                }
            }
        }
        .navigationBarTitle("H4X0R NEWS")
        .onAppear { networkManager.fetchData() }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}


