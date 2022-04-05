//
//  UserHelpers.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import Foundation
import CoreData

extension DBHelper {
    
    func addData(email: String, guest: String, password: String) {

        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User

//        var cart = Cart()
//        var wishlist = Wishlist()
//        wishlist.name = "no wishlist"
//        cart.deliveryFee = 0
//        cart.total = 0
//        var fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Cart")
//        do {
//            let req = try context?.fetch(fReq) as! [Cart]
//            if(req.count != 0) {
//                cart = req.first!
//            }
//        } catch { }

        user.email = email
        user.guest = guest
        user.password = password
//        user.cartRel = cart
//        user.wishlistRel = wishlist

        do {
            try context?.save()
        } catch {
            print("Not saved------------------------------------")
        }
    }
    
    func getUsers() -> [User] {
        var users = [User]()
        let fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")

        do {
            users = try context?.fetch(fReq) as! [User]
        } catch {
            print("Error Getting User from DB")
        }
        return users
    }
    
    func getOneUser(email: String) -> User {
        var user = User()
        let fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: " email == %@ ", email)
//        fReq.fetchLimit = 1

        do {
            let req = try context?.fetch(fReq) as! [User]
            if(req.count != 0) {
                user = req.first as! User
            } else {
                print("Data Not Found")
            }
        } catch {
            print("try didnt work")
        }
        return user
    }
}
