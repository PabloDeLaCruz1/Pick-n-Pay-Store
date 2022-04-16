//
//  CartHelper.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//

import Foundation
import UIKit
import CoreData

class CartHelper {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    static var inst = CartHelper()
    
    func deleteFromCart() {
        
        print("Hello")
        
    }
    
}
