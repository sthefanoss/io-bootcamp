//
//  ItemsManager.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 23/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class ItemsManager {
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first?.appendingPathComponent("Items.plist")
    var items = [Item]()
    
    
    func load () {
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: dataFilePath!)
            items = try decoder.decode([Item].self, from: data)
        } catch let err {
            print("error load \(err)")
        }
    }
    
    private func save() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath!)
        } catch let err {
            print("error save \(err)")
        }
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
