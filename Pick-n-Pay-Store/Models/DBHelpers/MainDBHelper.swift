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
    let phoneNumber = Expression<String>("phone_number")
    let password = Expression<String>("password")
    let guest = Expression<String>("no status")

    let cart = Expression<Cart>("cart")
    

//    let wishlist = Wishlist()
//    let history: [String] = []
//    let orders = [Order]()
//    let creditcard : String = ""

    init() {
        db = connectDatabase()
        createUserTable()
//        insertUser(userName: "Foo", userEmail: "bar@mac.com")
//        insertUser(userName: "Yo", userEmail: "mama@gmail.com", userGuest: true, userCart: Cart())

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





