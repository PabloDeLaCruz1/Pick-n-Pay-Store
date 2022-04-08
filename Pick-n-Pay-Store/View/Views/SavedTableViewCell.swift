//
//  SavedTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var savedItemImg: UIImageView!
    @IBOutlet weak var savedItemDesc: UILabel!
    @IBOutlet weak var savedItemPrice: UILabel!
    @IBOutlet weak var savedItemStepperLabel: UITextField!
    @IBOutlet weak var savedItemStepper: UIStepper!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var moveButton: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        savedItemStepperLabel.text = "1"
        savedItemStepper.value = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
