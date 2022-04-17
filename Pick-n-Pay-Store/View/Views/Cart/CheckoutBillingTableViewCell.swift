//
//  CheckoutBillingTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/16/22.
//

import UIKit

class CheckoutBillingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var billingAddress: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
