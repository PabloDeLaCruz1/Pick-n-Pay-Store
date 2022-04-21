//
//  CartShippingOptionsTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/20/22.
//

import UIKit

class CartShippingOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var shippingOption: UILabel!
    
    var delegate : ShippingOptionsFunctions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func shippingOptionSelected(_ sender: UIButton) {
        
        self.delegate?.resetShipOptionCell()
        
        if sender.currentBackgroundImage!.description.contains("Unselected") == true {
            
            sender.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
            CSData.selectedShippingOption["type"] = CSData.shippingOptions[sender.tag]["type"]
            CSData.selectedShippingOption["length"] = CSData.shippingOptions[sender.tag]["length"]
            
        } else {
            
            sender.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)
            
          }
    
        //self.delegate?.reloadTableView()
    }

    
}

protocol ShippingOptionsFunctions {
    
    func resetShipOptionCell()
    
    //func reloadTableView()
    
}
