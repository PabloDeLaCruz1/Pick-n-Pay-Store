//
//  MainDBHelper.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 3/31/22.
//

import Foundation
import SQLite

class MainDBHelper {
    var db: Connection!

    //Users Table
    let usersTable = Table("users")
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let email = Expression<String>("email")
    
    //Orders Table
    let ordersTable = Table("orders")
    let shippingAddress = Expression<String?>("shippingAddress")
    let billingAddress = Expression<String?>("billingAddress")
    let payOption = Expression<String?>("payOption")
    let shippingOption = Expression<String?>("shippingOption")
    let balance = Expression<Double>("balance")

    init() {
        db = connectDatabase()
        createOrdersTable()
        createUserTable()
//        insertUser(userName: "Foo", userEmail: "bar@mac.com")
        insertUser(userName: "Baz2", userEmail: "foo2@mac.com")
        print(getUsers())
    }

    func connectDatabase() -> Connection? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("pick_n_pay_store.sqlite")
        do {
            let db = try Connection(fileURL.path)
            print("Database Connected at: \(fileURL.path)")
            return db
        } catch {
            print (error)
            return nil
        }
    }
    
    
}





