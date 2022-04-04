//////
//////  User+CoreDataProperties.swift
//////
//////
//////  Created by Pablo De La Cruz on 4/4/22.
//////
//////  This file was automatically generated and should not be edited.
//////
//////We turned off auto code gen for this file inacse we want to modify this file
////
////import Foundation
////import CoreData
////
////@objc(User) //nice to have for obj c representation
////class User: NSManagedObject {
////
////}
////extension User {
////
////    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
////        return NSFetchRequest<User>(entityName: "User")
////    }
////
////    @NSManaged public var cart: Cart?
////    @NSManaged public var email: String?
////    @NSManaged public var guest: String?
////    @NSManaged public var password: String?
////}
////
////extension User : Identifiable {
////
////}
//
////
////  User.swift
////  Pick-n-Pay-Store
////
////  Created by Pablo De La Cruz on 3/30/22.
////
////structs are for “bags of data”. Your Ints, your CGRect. Your Person record.
////If you find yourself talking to “something else” inside your struct code, where “something else” is the file system, the network, the GPS, you have made a wrong turn somewhere.
////If you find yourself with structs that contain structs that contain structs that contain structs, you have probably made a wrong turn somewhere. You’ll discover that way the hell down there somewhere you forgot a mutating, and now you have to mark mutating for all the things.
////Most types don’t need to be threadsafe. Most instances do. Use struct for the 10% of your types that make 90% of the instances. Use class for the 90% of your types that make up 10% of your instances.
////If overloading == to compare two things elementwise sounds like a great idea, use a struct. If you hesitate, use a class.
////https://www.swiftbysundell.com/articles/structuring-model-data-in-swift/
//import Foundation
//import CloudKit
//
////going to keep
//struct User: Identifiable, Decodable {
//
//    var id: Int
//    var email: String
////    var guest: Bool
////    var phoneNumber: String = ""
////    var password: String = ""
//
//    var cart: String
////    let wishlist: String
////    let orders: [String]
////    let history: [String] = []
////
////    let creditcard: String = ""
////
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case email
//        case cart
//
//    }
//
//    init (id: Int, email: String, cart: String) {
//        self.id = id
//        self.email = email
//        self.cart = cart
//    }
//
//
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.email = try container.decode(String.self, forKey: .email)
//        self.cart = try container.decode(String.self, forKey: .cart)
//    }
//
//
//}
//
//struct Cart {
//
//}
//struct Wishlist {
//
//}
//struct Order {
//
//}
