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
    static var selIndex = 0
    static var cartItems : [[String:String]] = [
        [
            "image" : "keychain",
            "description" : "Alphabet Initial Letter Keychain Resin Letter Keychain with Tassel Gradient Butterfly Pendant Bag Pendant",
            "price" : "7.49",
            "id": "0",
            "quantity" : "1"
        ],
        [
            "image" : "midori",
            "description" : "Midori MD Notebook - A5 Grid Paper",
            "price" : "11.49",
            "id": "1",
            "quantity" : "1"
        ],
        [
            "image" : "classic",
            "description" : "Buffalo Wild Wings Classic Sauce - Medium, Comfortably Hot - 12 fl. oz. - PACK OF 2",
            "price" : "12.00",
            "id": "2",
            "quantity" : "1"
        ],
        [
            "image" : "garlic",
            "description" : "Bundle of 2 - Buffalo Wild Wings Parmesan Roasted Garlic Sauces, 12 fl oz each (2 pack)",
            "price" : "13.81",
            "id": "3",
            "quantity" : "1"
        ],
        [
            "image" : "powder",
            "description" : "Gold Bond Medicated Talc-Free Foot Powder 10 oz, Maximum Strength Odor Control & Itch Relief",
            "price" : "7.97",
            "id": "4",
            "quantity" : "1"
        ]
//        [
//            "image" : "",
//            "description" : "Checkout Button Here",
//            "price" : "",
//            "id": ""
//        ]
    ]{
        
        didSet {
           
            
            
        }
        
    }
    static var savedItems = [
        [
            "image" : "biore",
            "description" : "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch",
            "price" : "23.97",
            "id": "0",
            "quantity" : "1"

        ],
        [
            "image" : "frixion",
            "description" : "PILOT FriXion Clicker Erasable, Refillable & Retractable Gel Ink Pens, Fine Point, Assorted Color Inks, 10-Pack Pouch",
            "price" : "15.15",
            "id": "1",
            "quantity" : "1"
        ],
        [
            "image" : "puma",
            "description" : "PUMA Women Sports Bra, 3-Pack",
            "price" : "32.85",
            "id": "2",
            "quantity" : "1"
        ],
        [
            "image" : "stamps",
            "description" : "Cling Stamp Set (Planner)",
            "price" : "10.24",
            "id": "3",
            "quantity" : "1"
        ],
        [
            "image" : "dymo",
            "description" : "DYMO Embossing Label Maker with 3 DYMO Label Tapes",
            "price" : "11.59",
            "id": "4",
            "quantity" : "1"
        ]
    ]{
        didSet {
            
        }
     }
    
    func drawEmptyCartSavedPage(view : UIView, segment : String) {
        
        var label : String
        var x1 : CGFloat
        var x2 : CGFloat
        
        switch segment.lowercased() {
            case "carts":
                label = "Your shopping cart is empty"
                x1 = (CSData.screenWidth/2) - 120
                x2 = (CSData.screenWidth/2) - 160
            default:
                label = "Your saved cart is empty"
                x1 = (CSData.screenWidth/2) - 110
                x2 = (CSData.screenWidth/2) - 140
        }
        
        
        let img = UIImageView()
        img.image = UIImage(named: segment)
        img.frame = CGRect(x: x1, y: 156, width: 230, height: 230)
        view.addSubview(img)
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 230),
            img.heightAnchor.constraint(equalToConstant: 230),
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -7)
        ])
        let lbl = UILabel()
        lbl.text = label
        lbl.font = UIFont(name: "Hiragino Mincho ProN", size: 25)
        lbl.frame = CGRect(x: x2, y:422, width: 333, height: 25)
        view.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -176.5)
        ])
        lbl.adjustsFontSizeToFitWidth = true
        
    }
   
    func updateArrayForIds(categories : String) {
        
        // this function updates the respective arrays when items are being move
        // around to cart and saved items
        
        switch categories.lowercased() {
            
            case "cart":
            for csd in 0...CSData.cartItems.count-1 {
                //for loop to update the id key of the item
                CSData.cartItems[csd]["id"] = String(csd)
            }
            case "saved":
                for csd in 0...CSData.savedItems.count-1 {
                    //for loop to update the id key of the item
                    CSData.savedItems[csd]["id"] = String(csd)
                }
            default:
                if(CSData.cartItems.count != 0) {
                    for csd in 0...CSData.cartItems.count-1 {
                        //for loop to update the id key of the item
                        CSData.cartItems[csd]["id"] = String(csd)
                    }
                }
                if(CSData.savedItems.count != 0) {
                    for csd in 0...CSData.savedItems.count-1 {
                        //for loop to update the id key of the item
                        CSData.savedItems[csd]["id"] = String(csd)
                    }
                }
        }
        
    }
    
}
