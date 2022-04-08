//
//  SavedTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class SavedTableViewController: UIViewController {

    let savedTableView = UITableView()
    let savedItems = CSData.savedItems

    override func viewDidLoad() {
        
        super.viewDidLoad()
        savedTableView.dataSource = self
        savedTableView.delegate = self
        savedTableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCell")
//        savedTableView.register(UINib(nibName: "CartButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CartButtonTableViewCell")
        setupTableView()
        
    }
    
    func setupTableView() {
        
        self.view.addSubview(savedTableView)
        savedTableView.translatesAutoresizingMaskIntoConstraints = false
        savedTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        savedTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        savedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        savedTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }

}

extension SavedTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return savedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        //if indexPath.row != CSData.savedItems.count-1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
            
            
            cell.savedItemImg.image = UIImage(named: savedItems[indexPath.row]["image"]!)
            cell.savedItemDesc.text = savedItems[indexPath.row]["description"]!
            cell.savedItemPrice.text = "$"+savedItems[indexPath.row]["price"]!
            cell.moveButton.tag = indexPath.row
            //cell.backgroundColor = .clear
            
            return cell
            
//        } else {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CartButtonTableViewCell", for: indexPath) as! CartButtonTableViewCell
//
//            var item = "items"
//
//            if CSData.cartItems.count == 1 {
//                item = "item"
//            }
//
//            cell.cartButtonProceedCheckout.setTitle("Proceed To Checkout (\(CSData.cartItems.count-1) \(item))", for: .normal)
//
//            return cell
//
//          }
    
    }
    
    
}

extension SavedTableViewController : UITableViewDelegate {
    
    
}
