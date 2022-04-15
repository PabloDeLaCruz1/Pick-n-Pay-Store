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

}

extension Item : Identifiable {

}

//Using this to make list of available items, TODO: pull items from API
extension Item {
    convenience init(name: String, comments: [String], offer: Bool, price: Double, tags: [String], productImage: String, productTitle: String, productPrice: String, productColor: Color, productDescription: String, isLiked: Bool = false, productRating: Int) {
        
        self.init()
        self.name = name
        self.comments = comments
        self.offer = offer
        self.price = price
        self.tags = tags
        
    }
}
