//
//  CheckoutShippingAddressTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/17/22.
//

import UIKit

class CheckoutShippingAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var receiversName: UILabel!
    @IBOutlet weak var receiversAddress: UILabel!
    @IBOutlet weak var receiversPhone: UILabel!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var deliverToButton: UIButton!
    
    var delegate : CellFunctions?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        deliverToButton.layer.cornerRadius = 10
        deliverToButton.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func circleClicked(_ sender: UIButton) {
        
        self.delegate?.resetCellState()
        
        if sender.currentBackgroundImage!.description.contains("Unselected") == true {
            sender.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
            deliverToButton.isHidden = false
        } else {
            sender.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)
            deliverToButton.isHidden = true
          }
        
    }
    
    @IBAction func deliverButtonClicked(_ sender: UIButton) {
    }
    
}

protocol CellFunctions {
    
    func resetCellState()
    
}
