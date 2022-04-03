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
struct User {
    var id: Int
    var guest = true
    
    var email: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    
    var cart = Cart()
    var wishlist = Wishlist()
    var history: [String] = []
    var orders = [Order]()
    var creditcard : String = ""
    
    init (id: Int, email: String, guest: Bool){
        self.id = id
        self.email = email
        self.guest = guest
    }
}

struct Cart {

}
struct Wishlist {

}
struct Order {
    //var tracking : TrackingInfo
    var status : String  //bought, refunded, pending, returned
    var balance : String //should be double had to be string
    var shippingAddress : String
    var billingAddress : String // can select to fill from shipping (same as shipping address)
    var payOption : String //Cash on Delievry/Payment on Delivery, credit card,net banking
    var shippingOption : String //Overnight, express, standard, delayed
    //var cart : Cart
    //var comment : Comment

    
    init(status: String , balance : String ,shippingAddress : String ,billingAddress: String , payOption : String , shippingOption : String){
        self.status = status
        self.balance = balance
        self.shippingAddress = shippingAddress
        self.billingAddress = billingAddress
        self.payOption = payOption
        self.shippingOption = shippingOption
    }
    
}
