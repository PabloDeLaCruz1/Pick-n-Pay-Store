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
////Current Model draft
////1
//class User {
//    var emailId : String
//    var phoneNumber : String
//    var password: String
//    var creditcard : String
//    var history : [String]
//    var orders : [Order]
//    var cart: Cart
//    var wishlist: Wishlist
//}
//
////2
//class Cart {
//    var items : [Item]
//    var total : Double   //false pay 10$, if true $0 //let deliveryFee = total >= 200? 0 : 10
//}
//
////3
//class Item {
//    var name : String
//    var price : Double
//    var tags : [String]
//    var offer : Bool
//    var comments : [String]
//}
//
////4
//class Wishlist {
//    var items : [Item]
//}
//
////5
//class Order {
//    var tracking : String
//    var status : String //bought, refunded, pending, returned
//    var balance : Double
//    var shippingAddress : String
//    var billingAddress : String // can select to fill from shipping (same as shipping address)
//    var payOption : String //Cash on Delievry/Payment on Delivery, credit card, net banking
//    var shippingOption : String //Overnight, express, standard, delayed
//    var cart : Cart
//}
//
//
//
