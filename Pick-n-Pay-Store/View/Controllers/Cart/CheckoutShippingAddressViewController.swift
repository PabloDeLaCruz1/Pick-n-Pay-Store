//
//  CheckoutShippingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit
import SwiftUI

class CheckoutShippingAddressViewController: UIViewController, NewShippingAddressFunctions {

    @IBOutlet weak var shippingAddressTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let shipData = CSData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Select Shipping Address"
        setupTable()
        
    }
    
    func setupTable() {
        
        shippingAddressTableView.delegate = self
        shippingAddressTableView.dataSource = self
        shippingAddressTableView.register(UINib(nibName: "CheckoutShippingAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutShippingAddressTableViewCell")
        shippingAddressTableView.register(UINib(nibName: "CheckoutAddShippingAddressButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutAddShippingAddressButtonTableViewCell")
        self.shippingAddressTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        let recInfo = CartHelper.inst.fetchReceiversInfo(email: currentUser.email!)
        
        if recInfo != nil {
            
            shipData.setupReceiversInfo(recInfo!)
            
        }
        
    }
    
    func goToAddShipping() {
        
        performSegue(withIdentifier: "AddShipping", sender: self)
        
    }

}

extension CheckoutShippingAddressViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {

            case 0:
                return CSData.receiversInfo.count
            default:
                return 1

        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutShippingAddressTableViewCell", for: indexPath) as! CheckoutShippingAddressTableViewCell
                
                return cell
            
            default:

                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutAddShippingAddressButtonTableViewCell", for: indexPath) as! CheckoutAddShippingAddressButtonTableViewCell
                
                cell.delegate = self
            
                return cell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
}

extension CheckoutShippingAddressViewController : UITableViewDelegate {
    
}
