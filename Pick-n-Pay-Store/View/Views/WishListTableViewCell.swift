//
//  WishListTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import UIKit
import SwiftUI

class WishListTableViewCell: UITableViewCell {
    
    
  
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    @Environment(\.currentUser) var currentUser
    var product : Product?
    
    @IBAction func itemMoveToCart(_ sender: Any) {
        //this button moves this item to the shopping cart.
        print("item moved to cart")
        
    }
    
    
    var heartButtonyes: Bool = true
    
    var heartButtonIsLiked: Bool = true
    
    //only changes heart color from pink to gray
    @IBAction func itemOffWishList(_ sender: Any) {
        //this button takes this itemm off of the WishList
       
        if product != nil{
            print("has a product")
        }
        else{
            print("doen't have a product")
        }
        
        if heartButtonIsLiked == true{
            DBHelper.db.removeWishList(email: currentUser.email!, product: product!)
            heartButtonIsLiked = false
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for:  .normal)
            print("item off of wishList")
                
            print(heartButtonyes)
        }
                                                                
        else if (heartButtonIsLiked == false){
            DBHelper.db.updateUserWishList(email: currentUser.email!, product: product!)
            heartButtonIsLiked = true
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.init(red: 1.00, green: 0.49, blue: 0.53, alpha: 1.00) , renderingMode: .alwaysOriginal), for:  .normal)
            print("item back on wishlist")
            
        }
        else{
            
        }
       
    }
    
}

