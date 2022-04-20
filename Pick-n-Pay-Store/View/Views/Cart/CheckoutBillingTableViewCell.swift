//
//  CheckoutBillingTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//

// this cell is what's seen on CheckoutViewController for Payment Information

import UIKit

class CheckoutBillingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var billingAddress: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var paymentStackView: UIStackView!
    @IBOutlet weak var billingAddressTitle: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        paymentButton.layer.cornerRadius = 10
        paymentButton.isHidden = true
        paymentButton.isEnabled = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
