//
//  Billings+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/17/22.
//
//

import Foundation
import CoreData


extension Billings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Billings> {
        return NSFetchRequest<Billings>(entityName: "Billings")
    }

    @NSManaged public var creditCard: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var billingAddress: String?
    @NSManaged public var isDefault: Int16
    @NSManaged public var sender: String?
    @NSManaged public var expirationDate: String?

}

extension Billings : Identifiable {

}
