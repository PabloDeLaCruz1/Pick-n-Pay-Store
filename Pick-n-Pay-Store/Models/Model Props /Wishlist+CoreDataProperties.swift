//
//  Wishlist+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//
//

import Foundation
import CoreData


extension Wishlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wishlist> {
        return NSFetchRequest<Wishlist>(entityName: "Wishlist")
    }

    @NSManaged public var items: Set<Item>?

}

extension Wishlist : Identifiable {

}
