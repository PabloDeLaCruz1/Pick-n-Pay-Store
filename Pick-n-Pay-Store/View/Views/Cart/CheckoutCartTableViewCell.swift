//
//  CheckoutCartTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/13/22.
//

import UIKit

class CheckoutCartTableViewCell: UITableViewCell {

    @IBOutlet weak var checkoutImg: UIImageView!
    @IBOutlet weak var checkoutDesc: UILabel!
    @IBOutlet weak var checkoutPrice: UILabel!
    @IBOutlet weak var checkoutStepperLabel: UITextField!
    @IBOutlet weak var checkoutStepper: UIStepper!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
