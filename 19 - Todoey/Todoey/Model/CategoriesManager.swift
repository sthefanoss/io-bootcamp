//
//  ItemsManager.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 23/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreData


class CategoriesManager {
    var categories = [CategoryEntity]()
    
    
    func load () {
        categories = ModelsManager.instance.load() ?? []
    }
    
    func insert(description : String) {
        let newEntity = ModelsManager.instance.getEntity() as CategoryEntity
        newEntity.name = description
        categories.append(newEntity)
        ModelsManager.instance.save()
    }
        
    func delete(_ item : CategoryEntity) {
//        items.removeAll(where: { $0 == item })
//        ModelsManager.instance.delete(obj: item)
    }
}
