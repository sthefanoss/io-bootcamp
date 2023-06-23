//
//  PostView.swift
//  H4X0R
//
//  Created by Sthefano Schiavon on 23/06/23.
//

import Foundation
import SwiftUI
import WebKit


struct PostView : UIViewRepresentable {
    let url : String?
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let url = url != nil ? URL(string: url!) : nil {
            let request = URLRequest(url: url)
            (uiView as? WKWebView)?.load(request)
        }
    }
}
