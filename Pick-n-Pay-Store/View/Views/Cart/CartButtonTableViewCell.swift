//
//  CartButtonTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class CartButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var cartButtonProceedCheckout: UIButton!
    @IBOutlet weak var subtotalStackView: UIStackView!
    @IBOutlet weak var subtotalLabel: UILabel!
    var cbtDelegate : CallCheckoutScreen?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        cartButtonProceedCheckout.layer.cornerRadius = 10
        showSubTotal()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkOut(_ sender: UIButton) {
    
        self.cbtDelegate?.callCheckoutScreen()
        
    }
    
    func showSubTotal() {
        
        var sum : Float = 0.00
        
        //ITEMS
        for cnt in 0...CSData.cartItems.count - 1 {
            
            sum += Float(CSData.cartItems[cnt]["price"]!)! * Float(CSData.cartItems[cnt]["quantity"]!)!
            
        }

        sum = Float(String(format: "%.2f", sum))!
        subtotalLabel.text = "$\(sum)"
        
    }
    
    
}

protocol CallCheckoutScreen {
    
    func callCheckoutScreen()
    
}
