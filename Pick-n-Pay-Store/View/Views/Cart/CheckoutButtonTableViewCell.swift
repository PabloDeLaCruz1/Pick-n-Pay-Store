//
//  CheckoutButtonTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/15/22.
//

import UIKit

class CheckoutButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var pyoButton: UIButton!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        pyoButton.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buyIt(_ sender: UIButton) {
    
        print("Order appended")
        ODData.savedItems.append(contentsOf: CSData.cartItems)
        print(ODData.savedItems)
        CSData.cartItems.removeAll()
        print("cart")
        print(CSData.cartItems)
        
    }
    
    
    
}
