//
//  ItemHelpers.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/5/22.
//

//class Item {
//    var name : String
//    var price : Double
//    var tags : [String]
//    var offer : Bool
//    var comments : [String]
//}
 
/*
import Foundation
import CoreData

extension DBHelper {

    func addItem(name: String, price: Double, tags: [String], offer: Bool, comments: [String]) {

        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item

        item.name = name
        item.price = price
        item.tags = tags
        item.offer = offer
        item.comments = comments

        do {
            try context?.save()
        } catch {
            print("Item not added")
        }
    }
    
    func addOffer(price: Double, offer: Bool) -> Double{
        var discount = price * 0.2
        if (offer == true){
            discount = price - discount
        }
        return discount
    }
    
    
    func addItemToCart(name: String, price: Double){
        
    }
    
    func addItemToWishlist(name: String, price: Double){
        /*var item = Item()
        var fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Item")
        do {
            let tempItem = try context?.fetch(fReq)

        }*/
    }
    
    func getItem() -> Item {
        var item = Item()
        var fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Item")

        do {
            item = try context?.fetch(fReq) as? Item ?? Item()
        } catch {
            print("Error getting item")
        }
        return item
    }

    func updateItem(name: String, price: Double, tags: [String]) {
        var item = Item()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fReq.predicate = NSPredicate(format: " name == %@ ", name)
        do {
            let tempItem = try context?.fetch(fReq)
            if(tempItem?.count != 0) {
                item = tempItem?.first as! Item
            }
            try context?.save()
            print("Item updated")
        } catch {
            print("Item not updated")
        }
    }
    
    func deleteItem(name: String) {
        let fReq = NSFetchRequest<NSManagedObject>(entityName: "Item")
        fReq.predicate = NSPredicate(format: " name == %@ ", name)
        do {
            let item = try context?.fetch(fReq)
            if item?.first != nil {
                print("Item deleted")
                context?.delete(item?.first as! Item)
                try context?.save()
            } else {
                print("No item to delete")
            }
        } catch {
        }
    }
}
*/
