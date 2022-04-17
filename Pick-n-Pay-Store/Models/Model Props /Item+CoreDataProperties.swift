//
//  Item+CoreDataProperties.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//
//

import Foundation
import CoreData
import UIKit


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var color: UIColor
    @NSManaged public var comments: [String]?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var isLiked: Bool
    @NSManaged public var name: String?
    @NSManaged public var offer: Bool
    @NSManaged public var price: Double
    @NSManaged public var rating: Int
    @NSManaged public var tags: [String]?
    @NSManaged public var isSaved: Int16
    @NSManaged public var quantity: Int16
    
}

extension Item : Identifiable {

}
