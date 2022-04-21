//
//  OrdersTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/8/22.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var refundBtn: UIButton!
    @IBOutlet weak var reviewOrder: UIButton!
    @IBOutlet weak var quantityOrder: UILabel!
    @IBOutlet weak var nameOrder: UILabel!
    @IBOutlet weak var balanceOrder: UILabel!
    @IBOutlet weak var statusOrder: UILabel!
    @IBOutlet weak var imageOrder: UIImageView!
    @IBOutlet weak var TrackPacakgeButton: UIButton!
    
   
    @IBAction func reviewOrderBtn(_ sender: Any) {
        
    }
    @IBAction func trackOrderAction(_ sender: Any) {
        
    }
    @IBAction func refundOrderButton(_ sender: Any) {
        ODData.savedItems.removeAll()
        print(ODData.savedItems)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        balanceOrder.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        nameOrder.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        nameOrder.numberOfLines = 0
        imageOrder.layer.masksToBounds = false
        imageOrder.layer.borderWidth = 1
        imageOrder.layer.borderColor = UIColor.blue.cgColor
        imageOrder.layer.cornerRadius = imageOrder.frame.height / 2
        imageOrder.clipsToBounds = true
        TrackPacakgeButton.layer.cornerRadius = 30
        reviewOrder.layer.cornerRadius = 30
        refundBtn.layer.cornerRadius = 30
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
