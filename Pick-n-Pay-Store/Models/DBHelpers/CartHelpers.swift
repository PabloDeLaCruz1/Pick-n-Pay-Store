//
//  UserHelpers.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import Foundation
import CoreData

extension DBHelper {

    func getCart() -> Cart {
        var cart = Cart()
        var fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Cart")

        do {
            cart = try context?.fetch(fReq) as? Cart ?? Cart()
        } catch {
            print("Error Getting Cart from DB")
        }
//
//        do {
//            let req = try context?.fetch(fReq) as! Cart
//            if(req.count != 0) {
//                st = req.first as! Cart
//            } else {
//                print("Data Not Found")
//            }
//        } catch {
//            print("try didnt work")
//        }
//
        return cart
    }
    

}
