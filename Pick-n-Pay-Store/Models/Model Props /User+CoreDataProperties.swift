//
//  User+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var guest: String?
    @NSManaged public var password: String?
    @NSManaged public var cartRel: Cart?
    @NSManaged public var wishlistRel: Wishlist?

}

extension User : Identifiable {

}
