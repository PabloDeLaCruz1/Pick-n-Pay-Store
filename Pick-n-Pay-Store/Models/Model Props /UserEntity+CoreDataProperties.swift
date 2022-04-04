//
//  UserEntity+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var guest: String?
    @NSManaged public var password: String?
    @NSManaged public var cartRel: CartEntity?
    @NSManaged public var wishlistRel: WishlistEntity?

}

extension UserEntity : Identifiable {

}
