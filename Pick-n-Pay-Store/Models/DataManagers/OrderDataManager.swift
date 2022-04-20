//
//  OrderDataManager.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/19/22.
//

import Foundation
import UIKit

struct ODData {
    static var savedItems : [[String:String]] = []
    
    func setupOrderSavedItems(items : Set<Item>) {
        
        
        ODData.savedItems = []
        
        
        if items.count != 0 {
        
            for item in items {
                    var savedArr : [String:String] = [:]
                    savedArr["image"] = item.image
                    savedArr["desc"] = item.desc
                    savedArr["price"] = String(item.price)
                    savedArr["quantity"] = String(item.quantity)
                    ODData.savedItems.append(savedArr)
                  }
            }
            
            print("SAVED: \(ODData.savedItems)")
        
        }
        
}

