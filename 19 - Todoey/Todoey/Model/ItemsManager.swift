//
//  ItemsManager.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 23/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class ItemsManager {
    private let key = "TodoList"
    var items = [Item]()
    
    
    func load () {
        let decoder = PropertyListDecoder()
        do {
            let data = UserDefaults.standard.data(forKey: key)
            if(data == nil) { return items = [] }
            items = try decoder.decode([Item].self, from: data!)
        } catch let err {
            items = []
            print("error decoding \(err)")
        }
    }
    
    private func save() {
        let encoder = PropertyListEncoder()
        UserDefaults.standard.set(
            try! encoder.encode(items),
            forKey: key
        )
    }
    
    func insert(description : String) {
        items.append(Item(description: description, done: false))
        save()
    }
    
    func toggle(at index : Int) {
        items[index] = Item(
            description: items[index].description,
            done: !items[index].done
        )
        save()
    }
}

struct Item : Codable {
    let description : String
    let done : Bool
}
