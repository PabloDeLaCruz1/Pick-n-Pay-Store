//
//  CoreDataManager.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    private init() {
        ValueTransformer.setValueTransformer(CartTransformer(), forName: NSValueTransformerName("CartTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "CDDataBase")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }

    }
}
