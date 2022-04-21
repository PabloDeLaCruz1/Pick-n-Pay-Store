//
//  OrdersHelper.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/21/22.
//

import Foundation
import UIKit
import CoreData

class OrdersHelper {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    static var inst = OrdersHelper()
    
    //CREATE-ADD
    
    //READ
    
    func fetchOrderInformation(email : String) -> [[String : String]]? {
        
        var orderInfo : [[String:String]] = []
        var tempArray : [String:String] = [:]
        
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Orders")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            
            let tempUser = try context?.fetch(fReq) as! [Orders]
            
            if tempUser.count != 0 {
                
                for k in 0...tempUser.count-1 {

                    //CART ITEMS
                    for j in tempUser[k].items! {

                        tempArray["desc"] = j.desc
                        tempArray["image"] = j.image
                        tempArray["price"] = String(j.price)
                        tempArray["quantity"] = String(j.quantity)
                        tempArray["billingAddress"] = tempUser[k].billingAddress
                        tempArray["balance"] = String(tempUser[k].balance)
                        tempArray["payOption"] = tempUser[k].payOption
                        tempArray["email"] = tempUser[k].email
                        tempArray["shippingAddress"] = tempUser[k].shippingAddress
                        tempArray["shippingOptions"] = tempUser[k].shippingOption
                        tempArray["trackingInfo"] = tempUser[k].trackingInfo
                        orderInfo.append(tempArray)
                        tempArray.removeAll()

                    }

                }

                print("ORDERS: \(orderInfo)")
                
            }
            
            
            
        } catch {
            
            print("FETCH ORDERS ERROR")
            return nil
            
          }
        
        return orderInfo
        
    }
    
    //UPDATE
    
    //DELETE

}
