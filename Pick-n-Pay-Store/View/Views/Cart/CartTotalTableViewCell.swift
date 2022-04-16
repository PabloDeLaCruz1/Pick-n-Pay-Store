//
//  CartTotalTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/14/22.
//

import UIKit

class CartTotalTableViewCell: UITableViewCell {

    @IBOutlet weak var itemsTitle: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        updateTotalOrder()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateTotalOrder() {
        
        var sum : Float = 0.00
        var items = "items"
        var ship : Float = 0.00
        var totalBeforeTax : Float = 0.00
        var tax : Float = 0.00
        var overallTotal : Float = 0.00
        var rand : Int = 3
        
        //ITEMS
        for cnt in 0...CSData.cartItems.count - 1 {
            
            sum += Float(CSData.cartItems[cnt]["price"]!)!
            
        }
        
        if CSData.cartItems.count == 1 {
            items = "item"
        }
        
        itemsTitle.text = "Items (\(CSData.cartItems.count) \(items)):"
        sum = Float(String(format: "%.2f", sum))!
        itemsLabel.text = "$\(sum)"
        
        //SHIPPING
        if sum >= 200 {
            shippingLabel.text = "$0.00"
            ship = 0.00
        } else {
            shippingLabel.text = "$10.00"
            ship = 10.00
          }
        
        //TOTAL BEFORE TAX
        totalBeforeTax = sum + ship
        totalBeforeTax = Float(String(format: "%.2f", totalBeforeTax))!
        totalLabel.text = "$\(totalBeforeTax)"
        
        //TAX TO BE COLLECTED
        rand = Int.random(in: 1...10) //percentage
        print("RAND: \(rand)")
        tax = (sum + ship) * Float((Float(rand) / 100))
        tax = Float(String(format: "%.2f", tax))!
        taxLabel.text = "$\(tax)"
        
        //OVERALL TOTAL
        overallTotal = totalBeforeTax + tax
        overallTotal = Float(String(format: "%.2f", overallTotal))!
        orderLabel.text = "$\(overallTotal)"
        
    }
    
}
