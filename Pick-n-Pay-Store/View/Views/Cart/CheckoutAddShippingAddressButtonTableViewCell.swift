//
//  CheckoutButtonTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/15/22.
//

import UIKit

class CheckoutAddShippingAddressButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var newShipAddButton: UIButton!
    var delegate : NewShippingAddressFunctions?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        newShipAddButton.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addNewShippingAddress(_ sender: UIButton) {
        
        self.delegate?.goToAddShipping()
        
    }

}

protocol NewShippingAddressFunctions {
    
    func goToAddShipping()
    
}
