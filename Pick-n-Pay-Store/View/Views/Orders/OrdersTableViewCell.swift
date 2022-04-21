//
//  OrdersTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/21/22.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderDesc: UILabel!
    @IBOutlet weak var trackingShipmentButton: UIButton!
    @IBOutlet weak var trackingStatus: UILabel!
    @IBOutlet weak var refundItemButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        trackingShipmentButton.layer.cornerRadius = 10
        refundItemButton.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showTrackingInfo(_ sender: UIButton) {
        
    }
    
    @IBAction func refundItem(_ sender: UIButton) {
        
    }
}
