//
//  User+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
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

extension User : Identifiable {

}
