//
//  CoreDataManager.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer
    let context : NSManagedObjectContext

    private init() {
        
        
        container = NSPersistentContainer(name: "CDDataBase")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save(){
        do{
            try context.save()
        }catch let error {
            print("core data error \(error.localizedDescription)")
        }
    }
}
