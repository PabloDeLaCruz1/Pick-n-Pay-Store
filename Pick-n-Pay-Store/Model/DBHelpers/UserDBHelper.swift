//
//  UserDBHelper.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 3/31/22.
//

import Foundation
import SQLite

extension MainDBHelper {

    func createUserTable() {
        do {
            try db.run(usersTable.create(ifNotExists: true) { t in // CREATE TABLE "users" IF NOT EXISTS (
                    t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
                    t.column(name) //     "name" TEXT,
                    t.column(email, unique: true, check: email.like("%@%")) //     "email" TEXT NOT NULL UNIQUE CHECK ("email" LIKE '%@%')
                }) // )
        } catch {
            print (error)
        }
    }

    func insertUser(userName: String, userEmail: String) {
        _ = usersTable.insert(name <- userName, email <- userEmail)

//        do {
//            for user in try db.prepare(usersTable) {
//                print("id: \(user[id]), name: \(user[name] ?? ""), email: \(user[email])")
//            }
//        } catch {
//            print (error)
//        }
    }

    func getUsers() -> [User] {
        var usersArray: [User] = []
        do {
            let users = try db.prepare(usersTable)
            for user in users {
                print("userId: \(user[id]), name: \(user[name]), email: \(user[email])")
                usersArray.append(User(id: Int(user[id])))
            }
        } catch {
            print (error)
        }
        return usersArray
    }

//   func getUserById(id: Int) -> User {
//
//
//    }
}
