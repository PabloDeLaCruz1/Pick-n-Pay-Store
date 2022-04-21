//
//  OrderDataManager.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/20/22.
//

import Foundation

class OrderInfo {
    
    var shippingAddress : String = ""
    var billingAddress : String = ""
    var payOption : String = ""
    var cart : [[String:String]] = []
    var status : String = ""
    var shippingOption : [String:String] = [:]
    var trackingInfo : String = ""
    var balance : Double = 0.00

    init(shippingAddress : String, billingAddress : String, payOption : String, cart : [[String:String]], status : String, shippingOption : [String:String], trackingInfo : String, balance : Double) {
        
        self.shippingAddress = shippingAddress
        self.billingAddress = billingAddress
        self.payOption = payOption
        self.cart = cart
        self.status = status
        self.shippingOption = shippingOption
        self.trackingInfo = trackingInfo
        self.balance = balance
        
    }
    
}

struct MyOrders {
    
    static var myOrders : [[String : String]] = []
    static var tempOrders : [String : String] = [:]
    
    func setupOrderItems(orders : [[String:String]]) {
        
        MyOrders.myOrders = []

        for a in 0...orders.count-1 {
            
            MyOrders.tempOrders["balance"] = orders[a]["balance"]
            MyOrders.tempOrders["billingAddress"] = orders[a]["billingAddress"]
            MyOrders.tempOrders["shippingAddress"] = orders[a]["shippingAddress"]
            MyOrders.tempOrders["payOption"] = orders[a]["payOption"]
            MyOrders.tempOrders["trackingInfo"] = orders[a]["trackingInfo"]
            MyOrders.tempOrders["status"] = orders[a]["status"]
            MyOrders.tempOrders["email"] = orders[a]["email"]
            MyOrders.tempOrders["image"] = orders[a]["image"]
            MyOrders.tempOrders["desc"] = orders[a]["desc"]
            MyOrders.tempOrders["quantity"] = orders[a]["quantity"]
            MyOrders.tempOrders["price"] = orders[a]["price"]
            MyOrders.myOrders.append(MyOrders.tempOrders)
            MyOrders.tempOrders = [:]
            
        }
        
        //print("CARTS: \(MyOrders.myOrders)")
        
    }
    
}
