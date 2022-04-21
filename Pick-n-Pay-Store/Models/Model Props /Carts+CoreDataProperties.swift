//
//  Carts+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/20/22.
//
//

import Foundation
import CoreData


extension Carts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Carts> {
        return NSFetchRequest<Carts>(entityName: "Carts")
    }

    @NSManaged public var items: Set<Item>?

}

extension Carts {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Carts : Identifiable {

}
