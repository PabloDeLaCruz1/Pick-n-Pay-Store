//
//  CartEntity+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var deliveryFee: Int64
    @NSManaged public var items: String?
    @NSManaged public var total: Int64

}

extension CartEntity : Identifiable {

}
