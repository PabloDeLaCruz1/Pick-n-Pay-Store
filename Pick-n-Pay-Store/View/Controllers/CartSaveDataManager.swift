//
//  CartSaveDataManager.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import Foundation
import UIKit

struct CSData {
    
    static var screenSize = UIScreen.main.bounds
    static var screenWidth = screenSize.width
    static var savedItems : [[String:String]] = []{didSet{print("SAVED ITEMS CHANGED")}}
//    static var cartItems : [[String:String]] = []{didSet{print("CART ITEMS CHANGED")}}
    static var cartItems = [
        [
            "image" : "biore",
            "description" : "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch",
            "price" : "23.97"
        ],
        [
            "image" : "frixion",
            "description" : "PILOT FriXion Clicker Erasable, Refillable & Retractable Gel Ink Pens, Fine Point, Assorted Color Inks, 10-Pack Pouch",
            "price" : "15.15"
        ],
        [
            "image" : "puma",
            "description" : "PUMA Women Sports Bra, 3-Pack",
            "price" : "32.85"
        ],
        [
            "image" : "stamps",
            "description" : "Cling Stamp Set (Planner)",
            "price" : "10.24"
        ],
        [
            "image" : "dymo",
            "description" : "DYMO Embossing Label Maker with 3 DYMO Label Tapes",
            "price" : "11.59"
        ],
        [
            "image" : "keychain",
            "description" : "Alphabet Initial Letter Keychain Resin Letter Keychain with Tassel Gradient Butterfly Pendant Bag Pendant",
            "price" : "7.49"
        ],
        [
            "image" : "midori",
            "description" : "Midori MD Notebook - A5 Grid Paper",
            "price" : "11.49"
        ],
        [
            "image" : "classic",
            "description" : "Buffalo Wild Wings Classic Sauce - Medium, Comfortably Hot - 12 fl. oz. - PACK OF 2",
            "price" : "12.00"
        ],
        [
            "image" : "garlic",
            "description" : "Bundle of 2 - Buffalo Wild Wings Parmesan Roasted Garlic Sauces, 12 fl oz each (2 pack)",
            "price" : "13.81"
        ],
        [
            "image" : "powder",
            "description" : "Gold Bond Medicated Talc-Free Foot Powder 10 oz, Maximum Strength Odor Control & Itch Relief",
            "price" : "7.97"
        ],
        [
            "image" : "",
            "description" : "Checkout Button Here",
            "price" : ""
        ]
    ]{didSet{print("CART ITEMS CHANGED")}}
    
}
