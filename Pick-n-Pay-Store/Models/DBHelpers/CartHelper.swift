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
    
    func addCartPayments(payInfo : [String:String]) -> Bool {
        
        let pay = NSEntityDescription.insertNewObject(forEntityName: "Billings", into: context!) as! Billings
        
        pay.isDefault = Int16((payInfo["isDefault"])!)!
        pay.creditCard = (payInfo["creditCard"])!
        pay.firstName = (payInfo["firstName"])!
        pay.lastName = (payInfo["lastName"])!
        pay.billingAddress = (payInfo["billingAddress"])!
        pay.sender = (payInfo["sender"])!
        pay.expirationDate = (payInfo["expirationDate"])!
        
        do {
            try context?.save()
            return true
        } catch {
            return false
          }
        
    }
    
    func addToOrder(email : String, orderInfo : OrderInfo) -> Bool {
        
        let order = NSEntityDescription.insertNewObject(forEntityName: "Orders", into: context!) as! Orders
            
        //ADD ORDER ENTITY
        
        order.billingAddress = orderInfo.billingAddress
        order.balance = orderInfo.balance
        order.payOption = orderInfo.payOption
        order.shippingAddress = orderInfo.shippingAddress
        order.shippingOption = orderInfo.shippingOption["type"]!+"-"+orderInfo.shippingOption["length"]!
        order.status = orderInfo.status
        order.trackingInfo = orderInfo.trackingInfo
        order.email = email
            
        do {
            
            for m  in 0...orderInfo.cart.count-1  {

                let item = Item(context: context!)

                item.desc = orderInfo.cart[m]["desc"]!
                item.image = orderInfo.cart[m]["image"]!
                item.price = Double(orderInfo.cart[m]["price"]!)!
                item.quantity = Int16(orderInfo.cart[m]["quantity"]!)!
                item.name = orderInfo.cart[m]["image"]!

                order.items!.insert(item)

            }
            
            
            try context?.save()
            
        } catch let error as NSError {
            
            print("ADDING ORDERS ERROR")
            print(error)
            return false
        
         }

        return true
        
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
    
    func getUserDefaultPayment(email : String) -> [String : String]? {
        
        var payInfo : [String : String] = [:]
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Billings")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            
            let rec = try context?.fetch(fReq) as! [Billings]
            payInfo["billingAddress"] = rec[0].billingAddress
            payInfo["firstName"] = rec[0].firstName
            payInfo["lastName"] = rec[0].lastName
            payInfo["sender"] = rec[0].sender
            payInfo["isDefault"] = String(rec[0].isDefault)
            payInfo["expirationDate"] = rec[0].expirationDate
            payInfo["creditCard"] = rec[0].creditCard
            
        } catch {
            
            print("Can't fetch any data!")
            
          }
        
        return payInfo
        
    }
    
    func fetchPaymentInfo(email : String) -> [[String:String]]? {
        
        var payInfo : [[String:String]] = []
        var tempArray : [String:String] = [:]
        
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Billings")
        fReq.predicate = NSPredicate(format: "sender == %@", email)
        
        do {
            
            let tempUser = try context?.fetch(fReq) as! [Billings]
            if tempUser.count != 0 {
                for k in 0...tempUser.count-1 {
                    
                    tempArray["billingAddress"] = tempUser[k].billingAddress
                    tempArray["firstName"] = tempUser[k].firstName
                    tempArray["lastName"] = tempUser[k].lastName
                    tempArray["sender"] = tempUser[k].sender
                    tempArray["isDefault"] = String(tempUser[k].isDefault)
                    tempArray["expirationDate"] = tempUser[k].expirationDate
                    tempArray["creditCard"] = tempUser[k].creditCard
                    payInfo.append(tempArray)
                    tempArray.removeAll()
                    
                }
            }
            
        } catch {
            print("FETCH BILLINGS ERROR")
            return nil
          }
        
        return payInfo
        
    }
    
    func checkUserDefaultPayment(email : String) -> Int {
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Billings")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            let cnt = try context?.fetch(fReq) as! [Billings]
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
    
    func fetchOrderInfo(email : String) -> [[String : Any]]? {
        
        var orderInfo : [[String:Any]] = []
        var tempArray : [String:Any] = [:]
        var cartArray : [[String:String]] = []
        var tempCart : [String:String] = [:]
        
        let fReq = NSFetchRequest<NSManagedObject>.init(entityName: "Orders")
        fReq.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            
            let tempUser = try context?.fetch(fReq) as! [Orders]
            if tempUser.count != 0 {
                print("WITH EMAIL")
                for k in 0...tempUser.count-1 {

                    tempArray["billingAddress"] = tempUser[k].billingAddress
                    tempArray["balance"] = String(tempUser[k].balance)
                    tempArray["payOption"] = tempUser[k].payOption
                    tempArray["email"] = tempUser[k].email
                    tempArray["shippingAddress"] = tempUser[k].shippingAddress
                    tempArray["shippingOptions"] = tempUser[k].shippingOption
                    tempArray["trackingInfo"] = tempUser[k].trackingInfo

                    //CART ITEMS
                    for j in tempUser[k].items! {

                        tempCart["desc"] = j.desc
                        tempCart["image"] = j.image
                        tempCart["price"] = String(j.price)
                        tempCart["quantity"] = String(j.quantity)
                        cartArray.append(tempCart)
                        tempCart.removeAll()

                    }

                    tempArray["cart"] = cartArray
                    orderInfo.append(tempArray)
                    tempArray.removeAll()

                }

                print("ORDERS: \(orderInfo)")
                
            }
            
            
            
        } catch {
            
            print("FETCH ORDERS ERROR")
            return nil
            
          }
        
        return orderInfo
        
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
    
    func updateDefaultPaymentForNewPaymentMethod(email : String, payInfo : [String : String]) -> Bool {
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Billings")
        
        let emailPredicate = NSPredicate(format: "sender==%@", email)
        let defaultPredicate = NSPredicate(format: "isDefault==1")
        
        fReq.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                emailPredicate,
                defaultPredicate
            ]
        )
        
        do {
            let cnt = try context?.fetch(fReq) as! [Billings]
            cnt[0].isDefault = 0
            return addCartPayments(payInfo: payInfo)
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
        fReq.predicate = NSPredicate(format: "email==%@", email)

        do {
            let tempUser = try context?.fetch(fReq) as! [User]
            
            if(tempUser.count != 0) { //for protection of multiple users
                
                //user = tempUser?.first as! User
            
                for k in 0...tempUser.count-1 {
                    
                    user = tempUser[k] as! User
                    
                    for uci in tempUser[k].cart!.items! {
                        
                        if uci.desc == itemCart["desc"]{
                        
                            user.cart!.items!.remove(uci)
                            deleted = true
                            
                        }
                        
                    }
                    
                }
            
            }
            
            try context?.save()
            //printData()
            return deleted
            
        } catch {
            print("DELETE ITEM IN CART / SAVED ERROR")
            return false
          }
        
    }
    
    func deleteAllFromCart(email : String, itemCart: [[String:String]]) -> Bool? {

        var deleted = false
        var temp = itemCart
            
        for j in 0...itemCart.count {
            
            deleted = deleteFromCartSaved(email: email, itemCart: itemCart[j])!
            
            if deleted == true {
                
                temp.remove(at: j)
                
            }
            
        }
        
        if temp.isEmpty == true {
            
            deleted = true
            
        }
        
        return deleted
        
    }
    
    // EMERGENCY FUNCTIONS
    
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
    
    func emergencyDeleteAllReceivers() -> Bool {
        
        let fReq: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Receivers")
        //fReq.predicate = NSPredicate(format: "email!=''")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fReq)

        do {
            try context?.execute(deleteRequest)
            try context?.save()
            //printData()
            return true
            //try myPersistentStoreCoordinator.execute(deleteRequest, with: myContext)
        } catch let error as NSError {
            print(error)
            return false
        }
        
    }
    
    func emergencyDeleteAllBillings() -> Bool {
        
        let fReq: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Billings")
        //fReq.predicate = NSPredicate(format: "email!=''")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fReq)

        do {
            try context?.execute(deleteRequest)
            try context?.save()
            //printData()
            return true
            //try myPersistentStoreCoordinator.execute(deleteRequest, with: myContext)
        } catch let error as NSError {
            print(error)
            return false
        }
        
    }
    
    func emergencyDeleteAllOrders() -> Bool {
        
        let fReq: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Orders")
        //fReq.predicate = NSPredicate(format: "email!=''")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fReq)

        do {
            try context?.execute(deleteRequest)
            try context?.save()
            //printData()
            return true
            //try myPersistentStoreCoordinator.execute(deleteRequest, with: myContext)
        } catch let error as NSError {
            print(error)
            return false
        }
        
    }
    
}
