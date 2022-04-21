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
    var heartButtonyes: Int = 1
    var heartButtonIsLiked: Bool?
    
    //only changes heart color from pink to gray
    @IBAction func itemOffWishList(_ sender: Any) {
        //this button takes this itemm off of the WishList
       
        switch (((product?.isLiked) != nil)
                && heartButtonIsLiked == true){
        case true:
            print("deleting item from Wishlist")
            //DBHelper.db.removeWishList(email: currentUser.email!, product: (product ?? product.unsafelyUnwrapped))
            heartButtonIsLiked = false
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for:  .normal)
            print("item off of wishList")
                
            print(heartButtonyes)
        case false:
            print("adding item to wishList")
            //DBHelper.db.updateUserWishList(email: currentUser.email!, product: (product ?? product.unsafelyUnwrapped))
            heartButtonIsLiked = true
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.init(red: 1.00, green: 0.49, blue: 0.53, alpha: 1.00) , renderingMode: .alwaysOriginal), for:  .normal)
            print("item back on wishlist")
        default:
            print("nothing here to show")
        }
        if product != nil{

        }
        else{
            print("doen't have a product")
        }

        if heartButtonyes == 1{
            //supposed to delete an item
            // DBHelper.db.removeWishList(email: currentUser.email!, product: product!)
            
            print(product)
            heartButtonyes = 0
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for:  .normal)
            print("item off of wishList")

            print(heartButtonyes)
        }

        else if (heartButtonyes == 0){
            //DBHelper.db.updateUserWishList(email: currentUser.email!, product: product!)
            heartButtonIsLiked = true
            heartButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.init(red: 1.00, green: 0.49, blue: 0.53, alpha: 1.00) , renderingMode: .alwaysOriginal), for:  .normal)
            print("item back on wishlist")

        }
        else{

        }
       
    }
    
}

