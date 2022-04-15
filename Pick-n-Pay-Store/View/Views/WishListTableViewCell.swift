//
//  WishListTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import UIKit

class WishListTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBAction func itemMoveToCart(_ sender: Any) {
        //this button moves this item to the shopping cart.
        print("item moved to cart")
        
    }
    
    @IBAction func itemOffWishList(_ sender: Any) {
        //this button takes this itemm off of the WishList
        print("item off of wishList")
    }

    
}
