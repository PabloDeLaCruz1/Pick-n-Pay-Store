//
//  CartButtonTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class CartButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var cartButtonProceedCheckout: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        cartButtonProceedCheckout.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
