//
//  Orders+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/20/22.
//
//

import Foundation
import CoreData


extension Orders {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Orders> {
        return NSFetchRequest<Orders>(entityName: "Orders")
    }

    @NSManaged public var balance: Double
    @NSManaged public var billingAddress: String?
    @NSManaged public var shippingAddress: String?
    @NSManaged public var email: String?
    @NSManaged public var shippingOption: String?
    @NSManaged public var payOption: String?
    @NSManaged public var trackingInfo: String?
    @NSManaged public var status: String?
    @NSManaged public var items: Set<Item>?

}

// MARK: Generated accessors for items
extension Orders {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Orders : Identifiable {

}
