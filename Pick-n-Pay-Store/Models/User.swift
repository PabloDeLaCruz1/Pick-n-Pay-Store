////
////  User+CoreDataProperties.swift
////
////
////  Created by Pablo De La Cruz on 4/4/22.
////
////  This file was automatically generated and should not be edited.
////
////We turned off auto code gen for this file inacse we want to modify this file
//
//import Foundation
//import CoreData
//
//@objc(User) //nice to have for obj c representation
//class User: NSManagedObject {
//
//}
//extension User {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
//        return NSFetchRequest<User>(entityName: "User")
//    }
//
//    @NSManaged public var cart: Cart?
//    @NSManaged public var email: String?
//    @NSManaged public var guest: String?
//    @NSManaged public var password: String?
//}
//
//extension User : Identifiable {
//
//}

//
//  User.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 3/30/22.
//
//structs are for “bags of data”. Your Ints, your CGRect. Your Person record.
//If you find yourself talking to “something else” inside your struct code, where “something else” is the file system, the network, the GPS, you have made a wrong turn somewhere.
//If you find yourself with structs that contain structs that contain structs that contain structs, you have probably made a wrong turn somewhere. You’ll discover that way the hell down there somewhere you forgot a mutating, and now you have to mark mutating for all the things.
//Most types don’t need to be threadsafe. Most instances do. Use struct for the 10% of your types that make 90% of the instances. Use class for the 90% of your types that make up 10% of your instances.
//If overloading == to compare two things elementwise sounds like a great idea, use a struct. If you hesitate, use a class.
//https://www.swiftbysundell.com/articles/structuring-model-data-in-swift/
import Foundation

//going to keep
struct User: Identifiable {

    var id: Int
    var email: String
//    var guest: Bool
//    var phoneNumber: String = ""
//    var password: String = ""

    var cart: String
//    let wishlist: String
//    let orders: [String]
//    let history: [String] = []
//
//    let creditcard: String = ""
//
//    init (id: Int, email: String, guest: Bool) {
//        self.id = id
//        self.email = email
//        self.guest = guest
//    }
//
//    init(coder aDecoder: NSCoder)
//    {
//        self.cart = aDecoder.decodeObject(forKey: "cart") as! String
//        self.wishlist = aDecoder.decodeObject(forKey: "wishlist") as! String
//        self.orders = aDecoder.decodeObject(forKey: "orders") as! [String]
//    }
//
//    func encode(with aCoder: NSCoder)
//    {
//        aCoder.encode(self.cart, forKey: "cart")
//        aCoder.encode(self.wishlist, forKey: "wishlist")
//        aCoder.encode(self.orders, forKey: "orders")
//    }
}

struct Cart {

}
struct Wishlist {

}
struct Order {

}
