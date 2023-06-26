//
//  ModelsManager.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 25/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreData

struct ModelsManager {
    private init() {}
    static var instance = ModelsManager()
    
    lazy var persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Models")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        }
        return container
    }()
    
    mutating func load<T:NSManagedObject>(requestBuilder: ((NSFetchRequest<any NSFetchRequestResult>) -> Void)? = nil) -> [T]? {
        let context = persistentContainer.viewContext
        let request = T.fetchRequest()
        requestBuilder?(request)
        return try? context.fetch(request) as? [T]
    }
    
    mutating func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
    
    mutating func delete<T:NSManagedObject>(obj: T) {
        let context = persistentContainer.viewContext
        context.delete(obj)
        do {
            try context.save()
        } catch {
            print("error \(error)")
        }
    }
    
    mutating func getEntity<T:NSManagedObject> () -> T {
        return T(context: persistentContainer.viewContext)
    }
}
