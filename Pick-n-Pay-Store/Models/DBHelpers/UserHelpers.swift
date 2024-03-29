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

        let cart = Cart(context: context!)
        let wishlist = Wishlist(context: context!)
        let orders = Order.init(context: context!)
        cart.total = 0

        user.email = email
        user.guest = guest
        user.password = password
        user.cart = cart
        user.cart?.saved = 12

        user.wishlist = wishlist
        user.history = [""]
        user.creditCard = "0000-0000-0000-0000"

        do {
            try context?.save()
        } catch {
            print("Not saved------------------------------------")
        }
    }
    
    
    func addUser(user: User) {

        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User

        let cart = Cart(context: context!)
        let wishlist = Wishlist(context: context!)
        let orders = Order.init(context: context!)
        cart.total = 0
        cart.saved = 12

//        newUser.email = user.email
        newUser.guest = user.guest
        newUser.password = user.password
        newUser.cart = cart
        newUser.wishlist = wishlist
        newUser.history = [""]
        newUser.creditCard = "0000-0000-0000-0000"

        do {
            try context?.save()
        } catch {
            print("Not saved------------------------------------")
        }
    }

    func setAndGetGuest () -> User {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User

        let cart = Cart(context: context!)
        let wishlist = Wishlist(context: context!)
        let orders = Order.init(context: context!)
        cart.total = 0
        cart.saved = 12

        user.email = ""
        user.guest = "true"
        user.password = ""
        user.cart = cart
        user.wishlist = wishlist
        user.history = [""]
        user.creditCard = "0000-0000-0000-0000"

        do {
            try context?.save()
        } catch {
            print("Not saved------------------------------------")
        }

        return user
    }

    // MARK: - GET USERS DATA
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

    func getOneUser(email: String) -> User? {
        var user = User()
        let fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: " email == %@ ", email)
//        fReq.fetchLimit = 1

        do {
            let req = try context?.fetch(fReq) as! [User]
            if(req.count != 0) {
                user = req.first!
            } else {
                print("Data Not Found")
                return nil
            }
        } catch {
            print("try didnt work")
            return nil
        }
        return user
    }

    // MARK: - UPDATE USER DATA
    //overload this
    func updateUser(email: String, creditCard: String) {
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello  User Updating ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }

            user.creditCard = creditCard
            user.cart?.total = 100

            try context?.save()
            print("User \(email) updated")
        } catch {
            print("issues updating data")
        }
    }
    // MARK: - UPDATE USER DATA
    func updateUser(user: User) {
        var userHolder = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", "")
        print("Hello  User Updating ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                userHolder = tempUser?.first as! User
            }

            userHolder = user

            try context?.save()
            print("User email: \(userHolder.email ?? "NO ONE---") updated")
        } catch {
            print("issues updating data")
        }
    }
    // MARK: -  ADD USER ITEMS DATA
    func addUserItems ( itemDesc: String, itemImage: String, itemIsLiked: Bool, itemName: String, itemOffer: Bool, itemPrice:Double, itemRating:Int16){
        let itemsReq = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item
        
        
        itemsReq.desc = itemDesc
        itemsReq.image = itemImage
        itemsReq.isLiked = itemIsLiked
        itemsReq.name = itemName
        itemsReq.offer = itemOffer
        itemsReq.price = itemPrice
        itemsReq.rating = Int(itemRating)
     
        do{
            try context?.save()
            print("Data saved in User Items Entity")
        }
        catch{
            print("Data not saved in User Items Entity")
        }
    }
    // MARK:  SAVE WISH-LIST DATA
    func addWishListItem(itemName: String, itemImage: String, itemPrice: Double){
        let itemsReq = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item
        itemsReq.name = itemName
        itemsReq.image = itemImage
        itemsReq.price = itemPrice
    }
    
    // MARK: - UPDATE USER WISH-LIST  DATA

    //Return Item for easy access. Dont always need. should make product to item mapper. 
    func updateUserWishList(email: String, product: Product) -> Item{
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello User Updating Wishlist ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
            let item = Item(context: context!)

            item.desc = product.desc
//            item.rating = product.rating
            item.isLiked = product.isLiked
            item.tags = product.tags
            item.color = product.color
            item.price = product.price
            item.comments = product.comments
            item.name = product.name
            item.image = product.image
            item.offer = product.offer
            
            user.wishlist!.items!.insert(item)

            for i in user.wishlist!.items! {
                print("Item----------", i)
            }
            try context?.save()
            return item

        } catch {
            print("issues updating data")
        }
        return Item()

    }
    
    // MARK: - WISH LIST REMOVE ITEM DATA
    func removeWishList(email: String, product: Product){
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello User deleting item from Wishlist ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            context?.delete((user.wishlist!.items?.first)! )
            try context?.save()
            print("data deleted")
        }
        catch{
            
        }
    }
    
    // MARK: - WISH LIST ADD ITEM DATA
    func updateUserCart(email: String, product: Product) {
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello User Updating Cart Item ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
            let item = Item(context: context!)

            item.desc = product.desc
//            item.rating = product.rating
            item.isLiked = product.isLiked
            item.tags = product.tags
            item.color = product.color
            item.price = product.price
            item.comments = product.comments
            item.name = product.name
            item.image = product.image
            item.offer = product.offer
            item.isSaved = product.isSaved
            item.quantity = product.quantity

            user.cart!.items!.insert(item)
            user.cart!.total += product.price
            for i in user.cart!.items! {
                print("Cart Item----------", i)
            }
            try context?.save()
        } catch {
            print("issues updating Cart Item Data")
        }
    }
    
    func updateUserCartStatus(email: String) {
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello User Updating Cart Item ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
            user.cart?.saved = 1
            
            try context?.save()
        } catch {
            print("issues updating Cart Item Data")
        }
    }
    
    func addCommentToItem(commentText : String, product : Product){
        
    }
    //saving wishList items test
    func addItemWishList(){
        
    }

    func addOrder(email: String, order: Order) {
        var user = User()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        print("Hello User Adding Order ")
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }

//            user.orders?.insert(order)
//            for i in user.orders! {
//                print("Orders----------", i)
//            }
            try context?.save()
        } catch {
            print("issues updating data")
        }
    }

    func deleteUser(email: String) {
        let fReq = NSFetchRequest<NSManagedObject>(entityName: "User")
        fReq.predicate = NSPredicate(format: " email == %@ ", email)
        do {
            let user = try context?.fetch(fReq)
            if user?.first != nil {
                print("User \(user) delete")

                context?.delete(user?.first as! User)
                try context?.save()

            } else {
                print("Nothing to delete")
            }
        } catch {

        }
    }
}
