//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Sthefano Schiavon on 23/06/23.
//

import Foundation

class NetworkManager : ObservableObject {
    @Published var posts = [Post]()
    
    
    func fetchData () {
        
        let session = URLSession.shared.dataTask(with: URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")!) {
            (data, response, error) in
            
            if (error != nil || data == nil) { return }
            print("foo")
            do {
                let result = try JSONDecoder().decode(Result.self, from: data!)
                DispatchQueue.main.async {
                    self.posts = result.hits.filter { $0.url != nil }
                }
            } catch let error {
                print(error)
            }
        }
        session.resume()
    }
}

struct Result : Decodable {
    let hits : [Post]
}

struct Post : Identifiable , Decodable {
    let title : String
    let points : Int
    let url : String?
    let objectID: String
    var id : String { return objectID }
}
