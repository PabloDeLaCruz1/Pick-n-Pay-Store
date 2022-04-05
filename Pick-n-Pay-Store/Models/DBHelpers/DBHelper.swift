//
//  DBHelper.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import Foundation
import CoreData
import UIKit


class DBHelper {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var db = DBHelper()
    
    
}

////1
//class User {
//    var id : Int
//    var cart: Cart // String
//    var wishlist: Wishlist
//    var history : [String]
//    var orders : [Order]
//    var creditcard : String
//
//    init(id: Int, cart: Cart) {
//        self.id = id
//        self.cart = cart
//    }
//}
//
////Sign in
//class GuestUser: User {
//
//}
//
//class RegisteredUser: User {
//    var emailId : String
//    var phoneNumber : String
//    var password: String
//
//}
//
////2
//class Cart {
//    var id : Int
//    var items : [Item]
//    var total : Double
//    var deliveryFee : Bool // false pay 10$, if true $0
//    //let deliveryFee = total >= 200? 0 : 10
//}
//
////3
//class Item {
//    var id : Int
//    var name : String
//    var price : Double
//    var tags : [String]
//    var offer : Bool
//    var comments : [Comment]
//}
//
////4
//class Wishlist {
//    var id : Int
//    var items : [Item]
//}
//class Comment{
//    var id : Int
//    var comment : String
//}
//
//class TrackingInfo {
//    var id : Int
//    var status : String //in progress, shipped, delivered, label created, arrived at,canceled, refund, etc
//}
//
////5
//class Order {
//    var tracking : TrackingInfo
//    var status : String //bought, refunded, pending, returned
//    var balance : Double
//    var shippingAddress : String
//    var billingAddress : String // can select to fill from shipping (same as shipping address)
//    var payOption : String //Cash on Delievry/Payment on Delivery, credit card, net banking
//    var shippingOption : String //Overnight, express, standard, delayed
//    var cart : Cart
//}



