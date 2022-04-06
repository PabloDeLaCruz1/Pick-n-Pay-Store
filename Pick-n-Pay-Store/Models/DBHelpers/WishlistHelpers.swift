//
//  UserHelpers.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import Foundation
import CoreData

extension DBHelper {
    
//    func getWishlist() -> Wishlist {
//        var wishlist = Wishlist()
//        var fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Wishlist")
//        do {
//            wishlist = try context?.fetch(fReq) as! Wishlist
//        } catch {
//            print("Error Getting Wishlist from DB")
//        }
//        return wishlist
//    }
    
    func updateWishlist(){
        
    }
    func addCollegeData(nc: String) {
        let cl = NSEntityDescription.insertNewObject(forEntityName: "Wishlist", into: context!) as! Wishlist
//        cl.items.append = nc

        do {
            try context?.save()
        } catch {
            print("Wishlist Data did not save.")
        }
    }
}
