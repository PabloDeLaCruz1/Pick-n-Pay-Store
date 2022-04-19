//
//  CheckoutShippingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit
import SwiftUI

class CheckoutShippingAddressViewController: UIViewController, NewShippingAddressFunctions, CellFunctions {

    @IBOutlet weak var shippingAddressTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let shipData = CSData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Select Shipping Address"
        setupTable()
        let recInfo = CartHelper.inst.fetchReceiversInfo(email: currentUser.email!)
        
        if recInfo != nil {
            
            shipData.setupReceiversInfo(recInfo : recInfo!)
            shippingAddressTableView.reloadData()
            
        }
        
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
            
            shipData.setupReceiversInfo(recInfo : recInfo!)
            shippingAddressTableView.reloadData()
            
        }
        
    }
    
    func goToAddShipping() {
        
        performSegue(withIdentifier: "AddShipping", sender: self)
        
    }
    
    func resetCellState() {
        
        //this function is for the recipients tableview cell, to be in their default before the button is clicked
        
        for j in 0...CSData.receiversInfo.count-1 {
            
            let indexPath = IndexPath(row: j, section: 0)
            let cell = shippingAddressTableView.cellForRow(at: indexPath) as? CheckoutShippingAddressTableViewCell
            cell?.deliverToButton.isHidden = true
            cell?.circleButton.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)

        }
        
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
            
                let fullname = CSData.receiversInfo[indexPath.row]["firstName"]!+" "+CSData.receiversInfo[indexPath.row]["lastName"]!
                    cell.receiversName.text = fullname
                cell.receiversAddress.text = CSData.receiversInfo[indexPath.row]["shippingAddress"]!
                cell.receiversPhone.text = CSData.receiversInfo[indexPath.row]["phoneNumber"]!
                cell.deliverToButton.tag = indexPath.row
                cell.circleButton.tag = indexPath.row
                cell.delegate = self
            
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
