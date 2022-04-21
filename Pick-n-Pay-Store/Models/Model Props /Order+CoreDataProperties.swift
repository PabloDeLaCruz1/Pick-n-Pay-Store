//
//  Order+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var balance: Double
    @NSManaged public var billingAddress: String?
    @NSManaged public var payOption: String?
    @NSManaged public var shippingAddress: String?
    @NSManaged public var shippingOption: String?
    @NSManaged public var status: String?
    @NSManaged public var trackingInfo: String?
    @NSManaged public var cart: Cart?

}

extension Order {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Order : Identifiable {

}
