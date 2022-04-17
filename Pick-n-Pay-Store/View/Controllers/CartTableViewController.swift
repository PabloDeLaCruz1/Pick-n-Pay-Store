//
//  CartTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit
import SwiftUI

class CartTableViewController: UIViewController, TVCFunctions, CallCheckoutScreen {

    public let cartTableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        cartTableView.register(UINib(nibName: "CartButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CartButtonTableViewCell")
        setupTableView()
        
    }
    
    func setupTableView() {
        
        self.view.addSubview(cartTableView) //adds the tableview object
        
        //next 5 lines setups the constraints of the table
        
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //the following line makes sure the whole table is visible
        
        self.cartTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    func updateTable() {
        
        //this function is called when user selects an item to be saved
        //triggered from table view cell
        
        self.view.subviews.forEach{ //clears the view object
            $0.removeFromSuperview()
        }
       
        if (CSData.cartItems.count > 1) {
            setupTableView()
            cartTableView.reloadData()
        } else {
            let newPage = CSData()
            newPage.drawEmptyCartSavedPage(view: self.view, segment: "carts")
          }
        
        self.parent?.viewDidLoad() //updates the number in the UISegmentControl title
        
    }

    func callCheckoutScreen() {
        
        // called when the checkout button is clicked from the table view cell
        
        self.parent?.performSegue(withIdentifier: "Checkout", sender: self.parent)
        
    }
    
}

extension CartTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
            case 0:
                return 1
            default:
                return CSData.cartItems.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        switch indexPath.section {
            
            case 0:
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "CartButtonTableViewCell", for: indexPath) as! CartButtonTableViewCell
                
                cell.cbtDelegate = self
                var item = "items"
                
                if CSData.cartItems.count == 1 {
                    item = "item"
                }
                
                cell.cartButtonProceedCheckout.setTitle("Proceed To Checkout (\(CSData.cartItems.count) \(item))", for: .normal)
                
                return cell
        
            default:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
                
                cell.cartItemImg.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
                cell.cartItemDesc.text = CSData.cartItems[indexPath.row]["desc"]!
                cell.cartItemPrice.text = "$"+CSData.cartItems[indexPath.row]["price"]!
                cell.cartItemStepperLabel.text = CSData.cartItems[indexPath.row]["quantity"]!
                cell.cartItemStepper.value = Double(CSData.cartItems[indexPath.row]["quantity"]!)!
            
                // the tags are used as marks for the remove and save-for-later functions
            
                cell.removeButton.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
                cell.saveLaterButton.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
                cell.cartItemStepper.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
            
                //declared to be able to use a function declared in this class using the table view cell

                cell.delegate = self
                
                return cell
            
            
            
          }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    
}

extension CartTableViewController : UITableViewDelegate {
    
    
}

