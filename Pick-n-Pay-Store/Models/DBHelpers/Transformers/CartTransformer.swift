//
//  CartTransformer.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import Foundation

class CartTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let cart = value as? Cart else { return nil }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: cart, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {

        guard let data = value as? Data else { return nil }
        do {
//            let cart = try NSKeyedUnarchiver.unarchivedObject(ofClasses: Cart, from: data)
//            let cart = try NSKeyedUnarchiver.unarchivedObject(ofClass: Cart, from: data)
            let cart = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)

            return cart
        } catch {
            return nil
        }

    }

}

