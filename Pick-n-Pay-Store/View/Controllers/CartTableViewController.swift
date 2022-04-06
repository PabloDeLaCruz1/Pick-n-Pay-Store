//
//  CartTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartTableViewController: UIViewController {
    
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    let cartTableView = UITableView()
    let cartItems = [[
                        "image" : "biore",
                        "description" : "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch",
                        "price" : "23.97"
                     ],
                     [
                        "image" : "frixion",
                        "description" : "PILOT FriXion Clicker Erasable, Refillable & Retractable Gel Ink Pens, Fine Point, Assorted Color Inks, 10-Pack Pouch",
                        "price" : "15.15"
                     ]
                    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        setupTableView()
        
    }
    
    func setupTableView() {
        
        self.view.addSubview(cartTableView)
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -5).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 24).isActive = true
        
    }

}

extension CartTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        cell.cartItemImg.image = UIImage(named: cartItems[indexPath.row]["image"]!)
        cell.cartItemDesc.text = cartItems[indexPath.row]["description"]!
        cell.cartItemPrice.text = "$"+cartItems[indexPath.row]["price"]!
        //cell.backgroundColor = .clear
        
        return cell
    
    }
    
    
}

extension CartTableViewController : UITableViewDelegate {
    
    
}
