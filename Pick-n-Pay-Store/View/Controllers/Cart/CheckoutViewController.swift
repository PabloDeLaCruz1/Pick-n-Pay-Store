//
//  CheckoutViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/14/22.
//

import UIKit
import SwiftUI

class CheckoutViewController: UIViewController {

    @IBOutlet weak var checkoutTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let initData = CSData()
    
    var existingReceivers : [[String : String]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTable()
        self.title = "Place Your Order"
        existingReceivers = CartHelper.inst.fetchReceiversInfo(email: currentUser.email!)!
        
        if existingReceivers.isEmpty == false {
        
            let recInfo = CartHelper.inst.getUserDefaultAddress(email: currentUser.email!)
            
            if recInfo?.isEmpty == false {
                
                initData.setupDefaultAddress(recInfo : recInfo!)
                checkoutTableView.reloadData()
                
            }
            
        }
        
    }

    func setupTable() {
        
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self
        
        checkoutTableView.register(UINib(nibName: "CheckoutCartTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutTableViewCell")
        checkoutTableView.register(UINib(nibName: "CartTotalTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTotalTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutButtonTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutShippingTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutShippingTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutBillingTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutBillingTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutAddShippingAddressButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutAddShippingAddressButtonTableViewCell")
        //makes sure the table is visible
        
        self.checkoutTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
}

extension CheckoutViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {

            case 0:
                return 1
            case 3:
                return CSData.cartItems.count
            default:
                return 1

        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CartTotalTableViewCell", for: indexPath) as! CartTotalTableViewCell
                
                return cell
            
            case 1:
            
            if existingReceivers.isEmpty == false {
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutShippingTableViewCell", for: indexPath) as! CheckoutShippingTableViewCell
                
                cell.accessoryType = .disclosureIndicator
            
                if CSData.selectedAddress.isEmpty == true {
                    cell.receiverName.text = CSData.defaultAddress["firstName"]! + " " + CSData.defaultAddress["lastName"]!
                    cell.receiverAddress.text = CSData.defaultAddress["shippingAddress"]!
                } else {
                    cell.receiverName.text = CSData.selectedAddress["firstName"]! + " " + CSData.selectedAddress["lastName"]!
                    cell.receiverAddress.text = CSData.selectedAddress["shippingAddress"]!
                }
            
                return cell
            
            } else {

                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutAddShippingAddressButtonTableViewCell", for: indexPath) as! CheckoutAddShippingAddressButtonTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                
                return cell
                
              }
            
            case 2:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutBillingTableViewCell", for: indexPath) as! CheckoutBillingTableViewCell
                
                cell.accessoryType = .disclosureIndicator
            
                return cell
            
            case 3:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutCartTableViewCell
            
                cell.checkoutImg.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
                cell.checkoutDesc.text = CSData.cartItems[indexPath.row]["desc"]!
                cell.checkoutPrice.text = "$"+CSData.cartItems[indexPath.row]["price"]!
                cell.checkoutStepperLabel.text = CSData.cartItems[indexPath.row]["quantity"]!
                cell.checkoutStepper.value = Double(CSData.cartItems[indexPath.row]["quantity"]!)!
                
                return cell
            
            default:

                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutButtonTableViewCell", for: indexPath) as! CheckoutButtonTableViewCell
                
                return cell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sec : String
        
        switch section {
            
            case 1:
                sec = "Shipping Address"
            case 2:
                sec = "Payment Information"
            case 3:
                sec = "Shipment Details"
            default:
                sec = ""
            
        }
        
        return sec
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            
            case 1:
                performSegue(withIdentifier: "ShippingScreen", sender: self)
            case 2:
                performSegue(withIdentifier: "BillingScreen", sender: self)
            default:
                print("No choice!")
            
        }
        
    }
    
}

extension CheckoutViewController : UITableViewDelegate {
    
}
