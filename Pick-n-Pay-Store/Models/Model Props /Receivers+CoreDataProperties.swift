//
//  Receivers+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/17/22.
//
//

import Foundation
import CoreData


extension Receivers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receivers> {
        return NSFetchRequest<Receivers>(entityName: "Receivers")
    }

    @NSManaged public var isDefault: Int16
    @NSManaged public var shippingAddress: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var sender: String?
    @NSManaged public var phoneNumber: String?

}

extension Receivers : Identifiable {

}
