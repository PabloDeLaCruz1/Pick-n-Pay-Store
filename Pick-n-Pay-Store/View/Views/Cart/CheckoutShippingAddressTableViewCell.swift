//
//  CheckoutShippingAddressTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/17/22.
//

import UIKit

class CheckoutShippingAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var receiversName: UILabel!
    @IBOutlet weak var receiversAddress: UILabel!
    @IBOutlet weak var receiversPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
