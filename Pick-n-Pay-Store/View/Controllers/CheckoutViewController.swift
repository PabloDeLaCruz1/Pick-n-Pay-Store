//
//  CheckoutViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/14/22.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var checkoutTableView: UITableView!
    @IBOutlet weak var podButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        podButton.layer.cornerRadius = 10
        setupTable()
        self.title = "Place Your Order"
        
    }

    func setupTable() {
        
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self
        checkoutTableView.register(UINib(nibName: "CheckoutCartTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutTableViewCell")
        
    }
    
}

extension CheckoutViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch section {
//
//            case 0:
                return CSData.cartItems.count - 1
//            default:
//                return 1
//
//        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        switch indexPath.section {
//
//            case 0:
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutCartTableViewCell
            
                cell.checkoutImg.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
                cell.checkoutDesc.text = CSData.cartItems[indexPath.row]["description"]!
                cell.checkoutPrice.text = "$"+CSData.cartItems[indexPath.row]["price"]!
                cell.checkoutStepperLabel.text = CSData.cartItems[indexPath.row]["quantity"]!
                cell.checkoutStepper.value = Double(CSData.cartItems[indexPath.row]["quantity"]!)!
                
                return cell
            
//            default:
//                print("Hello")
//
//        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}

extension CheckoutViewController : UITableViewDelegate {
    
}
