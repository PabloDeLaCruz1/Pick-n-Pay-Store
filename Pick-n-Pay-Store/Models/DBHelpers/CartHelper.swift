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
    
    func addCartReceivers(recInfo : [String:String]) -> Bool {
        
        let rec = NSEntityDescription.insertNewObject(forEntityName: "Receivers", into: context!) as! Receivers
        
        rec.isDefault = Int16((recInfo["isDefault"])!)!
        rec.phoneNumber = (recInfo["phoneNumber"])!
        rec.firstName = (recInfo["firstName"])!
        rec.lastName = (recInfo["lastName"])!
        rec.shippingAddress = (recInfo["shippingAddress"])!
        rec.sender = (recInfo["sender"])!
        
        do {
            try context?.save()
            return true
        } catch {
            return false
          }
        
    }
    
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
    
    func fetchReceiversInfo(email : String) -> [[String:String]]? {
        
        var recInfo : [[String:String]] = []
        var tempArray : [String:String] = [:]
        
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Receivers")
        fReq.predicate = NSPredicate(format: "sender == %@", email)
        
        do {
            
            let tempUser = try context?.fetch(fReq) as! [Receivers]
            if tempUser.count != 0 {
                for k in 0...tempUser.count-1 {
                    
                    tempArray["shippingAddress"] = tempUser[k].shippingAddress
                    tempArray["firstName"] = tempUser[k].firstName
                    tempArray["lastName"] = tempUser[k].lastName
                    tempArray["phoneNumber"] = tempUser[k].phoneNumber
                    tempArray["sender"] = tempUser[k].sender
                    tempArray["isDefault"] = String(tempUser[k].isDefault)
                    recInfo.append(tempArray)
                    tempArray.removeAll()
                    
                }
            }
            
        } catch {
            print("FETCH RECEIVERS ERROR")
            return nil
          }
        
        return recInfo
    }
    
    func checkUserDefaultAddress(email : String) -> Int {
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Receivers")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            let cnt = try context?.fetch(fReq) as! [Receivers]
            if cnt.count == 0 {
                return 0
            } else {
                return 1
              }
        } catch {
            print("Can't fetch any data!")
            return 2
          }
        
    }
    
    func getUserDefaultAddress(email : String) -> [String : String]? {
        
        var recInfo : [String : String] = [:]
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Receivers")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            
            let rec = try context?.fetch(fReq) as! [Receivers]
            recInfo["shippingAddress"] = rec[0].shippingAddress
            recInfo["firstName"] = rec[0].firstName
            recInfo["lastName"] = rec[0].lastName
            recInfo["phoneNumber"] = rec[0].phoneNumber
            recInfo["sender"] = rec[0].sender
            recInfo["isDefault"] = String(rec[0].isDefault)
            
        } catch {
            print("Can't fetch any data!")
            
          }
        
        return recInfo
        
    }
    
    func getData() -> [User] { //for debugging purpose only
        
        var stu = [User]()
        let fReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
        
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
                print("\n================\n")
                print("OWNER: \(String(describing: us[j].email))")
                //us[j].cart!.items!.removeAll()
                for k in us[j].cart!.items! {
                    print("DELETE RETAIN: \(k.desc)")
                }
                print("\n================\n")
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
    
    func updateDefaultAdressForNewAddress(email : String, recInfo : [String : String]) -> Bool {
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Receivers")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            let cnt = try context?.fetch(fReq) as! [Receivers]
            cnt[0].isDefault = 0
            return addCartReceivers(recInfo: recInfo)
        } catch {
            print("Can't fetch any data!")
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
                    print("DELETE FROM MAIN: \(uci.desc)")
                    print("DELETE MAIN: \(user.email!)")
                    user.cart!.items!.remove(uci)
                    deleted = true
                }
            }
            
            try context?.save()
            printData()
            return deleted
            
        } catch {
            print("DELETE ITEM IN CART / SAVED ERROR")
            return false
          }
        
    }
    
    func emergencyDeleteAllUsers() -> Bool {
        
        let fReq: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        //fReq.predicate = NSPredicate(format: "email!=''")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fReq)

        do {
            try context?.execute(deleteRequest)
            try context?.save()
            printData()
            return true
            //try myPersistentStoreCoordinator.execute(deleteRequest, with: myContext)
        } catch let error as NSError {
            print(error)
            return false
        }
        
    }
    
}
