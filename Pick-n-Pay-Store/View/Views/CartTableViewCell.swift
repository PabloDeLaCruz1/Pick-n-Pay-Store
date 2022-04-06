//
//  CartTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartItemImg: UIImageView!
    @IBOutlet weak var cartItemDesc: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemStepper: UIStepper!
    @IBOutlet weak var cartItemStepperLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cartItemStepperLabel.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cartItemStepperLabel.layer.cornerRadius = 0.5
        cartItemStepperLabel.text = "1"
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
    }
    
    @IBAction func saveItem(_ sender: UIButton) {
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        cartItemStepperLabel.text = Int(sender.value).description
        
        
    }
    
}
