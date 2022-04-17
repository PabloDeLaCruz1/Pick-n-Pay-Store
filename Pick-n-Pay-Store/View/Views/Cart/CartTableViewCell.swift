//
//  CartTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit
import SwiftUI

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartItemImg: UIImageView!
    @IBOutlet weak var cartItemDesc: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemStepper: UIStepper!
    @IBOutlet weak var cartItemStepperLabel: UITextField!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var saveLaterButton: UIButton!
    
    var delegate : TVCFunctions?
    @Environment(\.currentUser) var currentUser
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
        cartItemStepperLabel.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cartItemStepperLabel.layer.cornerRadius = 0.5
        cartItemStepperLabel.text = "1"
        cartItemStepper.value = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected statde
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        
        //REMOVE IN DATABASE
        
        let success = CartHelper.inst.deleteFromCartSaved(email : currentUser.email!, itemCart : CSData.cartItems[sender.tag])
        if success == true {
            self.delegate?.updateTable()
        } else {
            print("ERROR DELETING FROM CART")
          }
        
    }
    
    @IBAction func saveItem(_ sender: UIButton) {
        
        //UPDATE DATABASE
        
        let success = CartHelper.inst.moveToSaved(email : currentUser.email!, itemCart : CSData.cartItems[sender.tag])
        if success == true {
            self.delegate?.updateTable()
        } else {
            print("ERROR MOVING TO SAVED ITEMS")
          }

        
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        cartItemStepperLabel.text = Int(sender.value).description
        CSData.cartItems[sender.tag]["quantity"] = Int(sender.value).description
        
    }
    
}

protocol TVCFunctions {
    
    func updateTable()
    
    
}
