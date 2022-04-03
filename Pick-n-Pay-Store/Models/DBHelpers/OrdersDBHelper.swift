//
//  OrdersDBHelper.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/3/22.
//

import Foundation
import SQLite

extension MainDBHelper{
    
    func createOrdersTable() {
        do {
            try db.run(ordersTable.create(ifNotExists: true) { t in // CREATE TABLE "orders" IF NOT EXISTS (
                    t.column(shippingAddress)
                    t.column(billingAddress)
                    t.column(payOption)  
                    t.column(shippingOption)
                    t.column(balance)
                }) // )
        } catch {
            print (error)
        }
    }
    
    
}
