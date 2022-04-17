//
//  SavedTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit
import SwiftUI

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var savedItemImg: UIImageView!
    @IBOutlet weak var savedItemDesc: UILabel!
    @IBOutlet weak var savedItemPrice: UILabel!
    @IBOutlet weak var savedItemStepperLabel: UITextField!
    @IBOutlet weak var savedItemStepper: UIStepper!
    @IBOutlet weak var removeSavedButton: UIButton!
    @IBOutlet weak var stepperStackView: UIStackView!
    @IBOutlet weak var moveButton: UIButton!
    
    var delegate : SVCFunctions?
    
    @Environment(\.currentUser) var currentUser
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        savedItemStepperLabel.text = "1"
        savedItemStepper.value = 1
        stepperStackView.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        
        //REMOVE IN DATABASE
        
        let success = CartHelper.inst.deleteFromCartSaved(email : currentUser.email!, itemCart : CSData.savedItems[sender.tag])
        if success == true {
            self.delegate?.updateTable()
        } else {
            print("ERROR DELETING FROM SAVED")
          }
        
    }
    
    @IBAction func moveItem(_ sender: UIButton) {
        
        CSData.cartItems.append(CSData.savedItems[sender.tag])
        CSData.savedItems.remove(at: sender.tag)
        let uptr = CSData()
        uptr.updateArrayForIds(categories: "both")
        self.delegate?.updateTable()

    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
        savedItemStepperLabel.text = Int(sender.value).description
        CSData.savedItems[sender.tag]["quantity"] = Int(sender.value).description
        
    }
    
}

protocol SVCFunctions {
    
    func updateTable()
    
}
