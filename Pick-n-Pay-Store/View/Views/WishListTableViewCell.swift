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
    @IBOutlet weak var itemDiscountLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemWishListHeartImage: UIImageView!
    @IBOutlet weak var itemWishListHeartButton: UIButton!
    
    
    @IBAction func wishListButtonSelected(_ sender: Any) {
        print("this item in no longer in wishList")
        
        
    }
    
}
