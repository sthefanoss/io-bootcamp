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
        items = decode(input: UserDefaults.standard.data(forKey: key)) as [Item]? ?? []
    }
    
    private func save() {
        UserDefaults.standard.set(
            encode(input: items),
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

private func encode<T>(input: T?)  -> Data? where T:Encodable {
    if(input == nil) { return nil }
    do {
        return try JSONEncoder().encode(input!)
    } catch let err {
        print(err)
        return nil
    }
}


private func decode<T>(input: Data?) -> T? where T:Codable {
    if(input == nil) { return nil }
    do {
        return try JSONDecoder().decode(T.self, from: input!)
    } catch let err {
        print(err)
        return nil
    }
}
