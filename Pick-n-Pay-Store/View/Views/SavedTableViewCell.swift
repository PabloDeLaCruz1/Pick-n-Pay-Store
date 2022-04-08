//
//  SavedTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

protocol SVCFunctions {
    
    func updateTable()
    
}

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var savedItemImg: UIImageView!
    @IBOutlet weak var savedItemDesc: UILabel!
    @IBOutlet weak var savedItemPrice: UILabel!
    @IBOutlet weak var savedItemStepperLabel: UITextField!
    @IBOutlet weak var savedItemStepper: UIStepper!
    @IBOutlet weak var removeSavedButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    
    var delegate : SVCFunctions?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        savedItemStepperLabel.text = "1"
        savedItemStepper.value = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        
        CSData.savedItems.remove(at: sender.tag)
        if(CSData.savedItems.count != 0) {
            for csd in 0...CSData.savedItems.count-1 {
                //for loop to update the id key of the item
                CSData.savedItems[csd]["id"] = String(csd)
            }
        }
        self.delegate?.updateTable()
        
    }
    
    @IBAction func moveItem(_ sender: UIButton) {
        
        //remove extra element for the checkout button
        if CSData.cartItems.count != 0 {
            CSData.cartItems.remove(at: CSData.cartItems.count-1)
        }
        CSData.cartItems.append(CSData.savedItems[sender.tag])
        let cnt = CSData.cartItems.count
        CSData.cartItems[cnt-1]["id"] = String(cnt)
        //put back the checkout button
        CSData.cartItems.append([
                        "image" : "",
                        "description" : "Checkout Button Here",
                        "price" : "",
                        "id": ""
                    ])
        CSData.savedItems.remove(at: sender.tag)
        //need to update the ids
        for csd in 0...CSData.savedItems.count-1 {
            //for loop to update the id key of the item
            CSData.savedItems[csd]["id"] = String(csd)
        }
        for csd in 0..<CSData.cartItems.count-1 {
            //for loop to update the id key of the item
            CSData.cartItems[csd]["id"] = String(csd)
        }
        self.delegate?.updateTable()

    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        savedItemStepperLabel.text = Int(sender.value).description
        
    }
    
}
