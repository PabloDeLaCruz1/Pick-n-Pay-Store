//
//  Receivers+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//
//

import Foundation
import CoreData


extension Receivers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receivers> {
        return NSFetchRequest<Receivers>(entityName: "Receivers")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var shippingAddress: String?
    @NSManaged public var billingAddress: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var sender: String?

}

extension Receivers : Identifiable {

}
