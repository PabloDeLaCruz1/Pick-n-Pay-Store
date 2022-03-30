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

import Foundation

//going to keep
struct User {
    var id: Int
    var guest = true
    
    var emailId: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    
    var cart = Cart()
    var wishlist = Wishlist()
    var history: [String] = []
    var orders = [Order]()
    var creditcard : String = ""
    
    init (id: Int){
        self.id = id
    }
}

class Cart {

}
class Wishlist {

}
class Order {

}
