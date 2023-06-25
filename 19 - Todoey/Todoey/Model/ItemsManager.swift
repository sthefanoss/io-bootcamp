//
//  ItemsManager.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 23/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreData


class ItemsManager {
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first?.appendingPathComponent("Items.plist")
    var items = [ItemEntity]()
    
    
    func load () {
        items = ModelsManager.instance.load() as [ItemEntity]? ?? []
    }
    
    func insert(description : String) {
        let newEntity = ModelsManager.instance.getEntity() as ItemEntity
        newEntity.title = description
        newEntity.done = false
        items.append(newEntity)
        ModelsManager.instance.save()
    }
    
    func toggle(at index : Int) {
        items[index].done = !items[index].done
        ModelsManager.instance.save()
    }
}
