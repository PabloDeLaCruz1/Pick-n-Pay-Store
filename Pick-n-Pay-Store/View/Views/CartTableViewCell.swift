//
//  CartTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

protocol TVCFunctions {
    
    func updateTable()
    
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartItemImg: UIImageView!
    @IBOutlet weak var cartItemDesc: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemStepper: UIStepper!
    @IBOutlet weak var cartItemStepperLabel: UITextField!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var saveLaterButton: UIButton!
    
    var delegate : TVCFunctions?
    
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

        // Configure the view for the selected state
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        
        CSData.cartItems.remove(at: sender.tag)
        for csd in 0...CSData.cartItems.count-1 {
            //for loop to update the id key of the item
            CSData.cartItems[csd]["id"] = String(csd)
        }
        self.delegate?.updateTable()
        
    }
    
    @IBAction func saveItem(_ sender: UIButton) {
        
        CSData.savedItems.append(CSData.cartItems[sender.tag])
        CSData.cartItems.remove(at: sender.tag)
        //need to update the ids
        for csd in 0...CSData.cartItems.count-1 {
            //for loop to update the id key of the item
            CSData.cartItems[csd]["id"] = String(csd)
        }
        //need to update ids
        for csd in 0...CSData.savedItems.count-1 {
            //for loop to update the id key of the item
            CSData.savedItems[csd]["id"] = String(csd)
        }
        self.delegate?.updateTable()
        
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        cartItemStepperLabel.text = Int(sender.value).description
        
        
    }
    
}
