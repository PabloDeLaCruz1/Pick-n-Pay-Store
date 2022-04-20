//
//  CheckoutOtherPaymentMethodTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/19/22.
//

import UIKit
import SwiftUI

class CheckoutOtherPaymentMethodTableViewCell: UITableViewCell {

    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var oipImage: UIImageView!
    @IBOutlet weak var oipLabel: UILabel!
    @IBOutlet weak var selectedPaymentMethodButton: UIButton!
    @Environment(\.currentUser) var currentUser
    
    var otherDelegate : PaymentCellFunctions?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        selectedPaymentMethodButton.layer.cornerRadius = 10
        selectedPaymentMethodButton.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func circleClicked(_ sender: UIButton) {
        
        self.otherDelegate?.resetPaymentCellState()
        
        if sender.currentBackgroundImage!.description.contains("Unselected") == true {
            sender.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
            selectedPaymentMethodButton.isHidden = false
        } else {
            sender.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)
            selectedPaymentMethodButton.isHidden = true
          }
        
    }
    
    @IBAction func selectedPaymentMethodClicked(_ sender: UIButton) {
        
        CSData.selectedPayment["firstName"] = ""
        CSData.selectedPayment["lastName"] =  ""
        CSData.selectedPayment["billingAddress"] = ""
        CSData.selectedPayment["creditCard"] = oipLabel.text!
        CSData.selectedPayment["expirationDate"] = ""
        CSData.selectedPayment["sender"] = currentUser.email!
        CSData.selectedPayment["isDefault"] = "0"
        self.otherDelegate?.returnToCheckoutPage()
        
    }
}
