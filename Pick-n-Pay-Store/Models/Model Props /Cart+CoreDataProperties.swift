//
//  Cart+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var deliveryFee: Int64
    @NSManaged public var items: String?
    @NSManaged public var total: Int64

}

extension Cart : Identifiable {

}
