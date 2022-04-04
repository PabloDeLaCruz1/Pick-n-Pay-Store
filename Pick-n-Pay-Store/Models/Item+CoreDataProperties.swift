//
//  Item+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?

}

extension Item : Identifiable {

}
