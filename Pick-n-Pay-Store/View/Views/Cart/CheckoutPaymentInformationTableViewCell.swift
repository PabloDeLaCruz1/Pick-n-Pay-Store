//
//  CheckoutPaymentInformationTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/19/22.
//

import UIKit

class CheckoutPaymentInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var creditCardNumber: UILabel!
    @IBOutlet weak var accountHolder: UILabel!
    @IBOutlet weak var expirationDate: UILabel!
    @IBOutlet weak var paymentMethodButton: UIButton!
    
    var delegate : PaymentCellFunctions?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        paymentMethodButton.layer.cornerRadius = 10
        paymentMethodButton.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func paymentMethodButtonClicked(_ sender: UIButton) {
        
        CSData.selectedPayment["firstName"] = CSData.paymentsInfo[sender.tag]["firstName"]
        CSData.selectedPayment["lastName"] =  CSData.paymentsInfo[sender.tag]["lastName"]
        CSData.selectedPayment["billingAddress"] = CSData.paymentsInfo[sender.tag]["billingAddress"]
        CSData.selectedPayment["creditCard"] = CSData.paymentsInfo[sender.tag]["creditCard"]
        CSData.selectedPayment["expirationDate"] = CSData.paymentsInfo[sender.tag]["expirationData"]
        CSData.selectedPayment["sender"] = CSData.paymentsInfo[sender.tag]["sender"]
        CSData.selectedPayment["isDefault"] = CSData.paymentsInfo[sender.tag]["isDefault"]
        self.delegate?.returnToCheckoutPage()
        
    }
    
    @IBAction func circleButtonClicked(_ sender: UIButton) {
        
        if CSData.paymentsInfo.count > 0 {
            
            self.delegate?.resetPaymentCellState()
            
            if sender.currentBackgroundImage!.description.contains("Unselected") == true {
                sender.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
                paymentMethodButton.isHidden = false
            } else {
                sender.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)
                paymentMethodButton.isHidden = true
              }
      
        }
        
    }
}

protocol PaymentCellFunctions {
    
    func resetPaymentCellState()
    
    func returnToCheckoutPage()
    
}
