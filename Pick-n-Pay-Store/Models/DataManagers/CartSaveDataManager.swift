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
    static var cartItems : [[String:String]] = []
    static var savedItems : [[String:String]] = []
    static var receiversInfo : [[String:String]] = []
    static var selectedAddress : [String:String] = [:]
    static var defaultAddress : [String:String] = [:]
    
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
    
    func setupCartSavedItems(items : Set<Item>) {
        
        //print("ITEMS \(items.count)")
        //NEED TO FIND A BETTER IMPLEMENTATION FOR UPDATING UI SEGMENTED CONTROL
        CSData.cartItems = []
        CSData.savedItems = []
        
        if items.count != 0 {
        
            for item in items {
                if item.isSaved == 0 {
                    var tempArr : [String:String] = [:]
                    tempArr["image"] = item.image
                    tempArr["desc"] = item.desc
                    tempArr["price"] = String(item.price)
                    tempArr["quantity"] = String(item.quantity)
                    CSData.cartItems.append(tempArr)
                } else {
                    var savedArr : [String:String] = [:]
                    savedArr["image"] = item.image
                    savedArr["desc"] = item.desc
                    savedArr["price"] = String(item.price)
                    savedArr["quantity"] = String(item.quantity)
                    CSData.savedItems.append(savedArr)
                  }
            }
            
            updateArrayForIds(categories: "both")
        
        }
        
    }
    
    func setupReceiversInfo(recInfo : [[String:String]]) {
        
        CSData.receiversInfo = []
        
        if recInfo.isEmpty == false {
            
            for k in 0...recInfo.count-1 {
                
                var tempArray : [String : String] = [:]
                tempArray["firstName"] = recInfo[k]["firstName"]
                tempArray["lastName"] = recInfo[k]["lastName"]
                tempArray["shippingAddress"] = recInfo[k]["shippingAddress"]
                tempArray["phoneNumber"] = recInfo[k]["phoneNumber"]
                tempArray["sender"] = recInfo[k]["sender"]
                tempArray["isDefault"] = recInfo[k]["isDefault"]
                CSData.receiversInfo.append(tempArray)
                
            }
            
        }
        
        //print("RECEIVERS: \(CSData.defaultAddress)")
        
    }
    
    func setupDefaultAddress(recInfo : [String:String]) {
        
        CSData.defaultAddress = [:]
        
        CSData.defaultAddress["firstName"] = recInfo["firstName"]
        CSData.defaultAddress["lastName"] = recInfo["lastName"]
        CSData.defaultAddress["shippingAddress"] = recInfo["shippingAddress"]
        CSData.defaultAddress["phoneNumber"] = recInfo["phoneNumber"]
        CSData.defaultAddress["sender"] = recInfo["sender"]
        CSData.defaultAddress["isDefault"] = recInfo["isDefault"]
        
    }
    
}
