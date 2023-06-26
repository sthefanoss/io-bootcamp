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
    
    
    func load (titlePattern : String? = nil) {
        if(titlePattern == nil || titlePattern!.isEmpty) {
            items = ModelsManager.instance.load() as [ItemEntity]? ?? []
        } else {
            items = ModelsManager.instance.load { request in
                request.predicate = NSPredicate(format: "title CONTAINS[cp] %@", titlePattern!)
            } ?? []
        }
    }
    
    func insert(description : String) {
        let newEntity = ModelsManager.instance.getEntity() as ItemEntity
        newEntity.title = description
        newEntity.done = false
        items.append(newEntity)
        ModelsManager.instance.save()
    }
    
    func toggle(_ item : ItemEntity) {
        item.done = !item.done
        ModelsManager.instance.save()
    }
    
    func delete(_ item : ItemEntity) {
        items.removeAll(where: { $0 == item })
        ModelsManager.instance.delete(obj: item)
    }
}
