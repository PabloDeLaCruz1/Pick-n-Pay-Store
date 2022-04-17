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
    
    //CREATE - ADD
    
    //READ
    
    func fetchUserCart(email : String) -> Set<Item>? {
        
        var user = User()
        
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
        } catch {
            print("FETCH CART ERROR")
            return nil
          }
        
        return user.cart!.items!
        
    }
    
    func getData() -> [User] { //for debugging purpose only
        
        var stu = [User]()
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        
        do {
            stu = try context?.fetch(fReq) as! [User]
        } catch {
                print("Can't fetch any data!")
          }
        
        return stu
        
    }
    
    func printData() {
        
        let us = getData()
        if us.count != 0 {
            for j in 0...us.count-1{
                print("USER \(j): \(us[j].email!)")
            }
        } else {
           print("No Users!")
          }
        
    }
    
    //UPDATE
    
    func moveToCartSaved(email : String, itemCart : [String : String], from : String) -> Bool? {
        
        var user = User()
        var moved = false

        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)

        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
            for uci in user.cart!.items! {
                if uci.desc == itemCart["desc"]{
                    if from.lowercased() == "cart" {
                        uci.isSaved = 1
                    } else {
                        uci.isSaved = 0
                      }
                    moved = true
                }
            }
            
            try context?.save()
            
            return moved
            
        } catch {
            print("MOVE ITEM IN CART / SAVED ERROR")
            return false
          }
        
    }
    
    //DELETE
    
    func deleteFromCartSaved(email : String, itemCart : [String : String]) -> Bool? {
        
        var user = User()
        var deleted = false

        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fReq.predicate = NSPredicate(format: "email == %@", email)

        do {
            let tempUser = try context?.fetch(fReq)
            if(tempUser?.count != 0) {
                user = tempUser?.first as! User
            }
            
            for uci in user.cart!.items! {
                if uci.desc == itemCart["desc"]{
                    user.cart!.items!.remove(uci)
                    deleted = true
                }
            }
            
            try context?.save()
            
            return deleted
            
        } catch {
            print("DELETE ITEM IN CART / SAVED ERROR")
            return false
          }
        
    }
    
    func deleteData(all: Bool) -> Bool {
        
        let fReq: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        fReq.predicate = NSPredicate(format: "username!=''")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fReq)

import Foundation
