//
//  CartTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartTableViewController: UIViewController {
    
    let cartTableView = UITableView()
    let cartItems = CSData.cartItems

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
        
    }

}

extension CartTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.row != CSData.cartItems.count-1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
            
            
            cell.cartItemImg.image = UIImage(named: cartItems[indexPath.row]["image"]!)
            cell.cartItemDesc.text = cartItems[indexPath.row]["description"]!
            cell.cartItemPrice.text = "$"+cartItems[indexPath.row]["price"]!
            cell.saveLaterButton.tag = indexPath.row
            //cell.backgroundColor = .clear
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartButtonTableViewCell", for: indexPath) as! CartButtonTableViewCell
            
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
