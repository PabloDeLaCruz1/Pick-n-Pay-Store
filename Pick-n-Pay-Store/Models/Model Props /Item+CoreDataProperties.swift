//
//  Item+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//
//

import Foundation
import CoreData
import SwiftUI

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var comments: [String]?
    @NSManaged public var name: String?
    @NSManaged public var offer: Bool
    @NSManaged public var price: Double
    @NSManaged public var tags: [String]?
    
    @NSManaged public var image: String
    @NSManaged public var color: UIColor
    @NSManaged public var desc: String
    @NSManaged public var isLiked: Bool
    @NSManaged public var rating: Int

}

extension Item : Identifiable {

}

