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

        var cart = Cart(context: context!)
        var wishlist = Wishlist(context: context!)
        cart.total = 0

        user.email = email
        user.guest = guest
        user.password = password
        user.cart = cart
        user.wishlist = wishlist
        user.history = [""]
        user.creditCard = "0000-0000-0000-0000"

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
    
    func updateUser(email: String, creditCard: String) {
        var user = User()
        var fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello  User Updating ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }

            user.creditCard = creditCard

            try context?.save()
            print("User \(email) updated")
        } catch {
            print("issues updating data")
        }
    }

    func deleteUser(email: String) {
        var fReq = NSFetchRequest<NSManagedObject>(entityName: "User")
        fReq.predicate = NSPredicate(format: " email == %@ ", email)
        do {
            let user = try context?.fetch(fReq)
            if user?.first != nil {
                context?.delete(user?.first as! User)
                try context?.save()
                print("User \(email) delete")

            } else {
                print("Nothing to delete")
            }
        } catch {

        }
    }
}
