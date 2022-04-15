//
//  CartTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

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
        
        self.view.addSubview(cartTableView)
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.cartTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    func updateTable() {
        
        //this function is called when user selects an item to be saved
        //triggered from table view cell
        self.view.subviews.forEach{
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
        
        
        self.parent?.performSegue(withIdentifier: "Checkout", sender: self.parent)
        
    }
    
}

extension CartTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CSData.cartItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.row != CSData.cartItems.count-1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
            
            cell.cartItemImg.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
            cell.cartItemDesc.text = CSData.cartItems[indexPath.row]["description"]!
            cell.cartItemPrice.text = "$"+CSData.cartItems[indexPath.row]["price"]!
            cell.removeButton.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
            cell.saveLaterButton.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
            cell.cartItemStepper.tag = Int(CSData.cartItems[indexPath.row]["id"]!)!
            cell.delegate = self
            cell.cartItemStepperLabel.text = CSData.cartItems[indexPath.row]["quantity"]!
            cell.cartItemStepper.value = Double(CSData.cartItems[indexPath.row]["quantity"]!)!
            
            //cell.backgroundColor = .clear
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartButtonTableViewCell", for: indexPath) as! CartButtonTableViewCell
            
            cell.cbtDelegate = self
            var item = "items"
            
            if CSData.cartItems.count == 1 {
                item = "item"
            }
            
            cell.cartButtonProceedCheckout.setTitle("Proceed To Checkout (\(CSData.cartItems.count-1) \(item))", for: .normal)
            
            return cell
            
          }
    
    }
    
    
}

extension CartTableViewController : UITableViewDelegate {
    
    
}

