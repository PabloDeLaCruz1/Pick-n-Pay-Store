//
//  User+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var creditCard: String?
    @NSManaged public var email: String?
    @NSManaged public var guest: String?
    @NSManaged public var history: [String]?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var cart: Cart?
    @NSManaged public var orders: Set<Order>?
    @NSManaged public var wishlist: Wishlist?

}

// MARK: Generated accessors for orders
extension User {

    @objc(addOrdersObject:)
    @NSManaged public func addToOrders(_ value: Order)

    @objc(removeOrdersObject:)
    @NSManaged public func removeFromOrders(_ value: Order)

    @objc(addOrders:)
    @NSManaged public func addToOrders(_ values: NSSet)

    @objc(removeOrders:)
    @NSManaged public func removeFromOrders(_ values: NSSet)

}

extension User : Identifiable {

}
