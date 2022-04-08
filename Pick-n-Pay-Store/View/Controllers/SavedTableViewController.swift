//
//  SavedTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class SavedTableViewController: UIViewController, SVCFunctions {
    
    public let savedTableView = UITableView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        savedTableView.dataSource = self
        savedTableView.delegate = self
        savedTableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCell")
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
    
    func updateTable() {
        
        //this function is called when user selects an item to be moved back
        //triggered from table view cell
        self.view.subviews.forEach{
            $0.removeFromSuperview()
        }
        if (CSData.savedItems.count > 0) {
            setupTableView()
            savedTableView.reloadData()
        } else {
            let newPage = CSData()
            newPage.drawEmptyCartSavedPage(view: self.view, segment: "saved")
          }
    }

}

extension SavedTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CSData.savedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
        
        
        cell.savedItemImg.image = UIImage(named: CSData.savedItems[indexPath.row]["image"]!)
        cell.savedItemDesc.text = CSData.savedItems[indexPath.row]["description"]!
        cell.savedItemPrice.text = "$"+CSData.savedItems[indexPath.row]["price"]!
        cell.removeSavedButton.tag = Int(CSData.savedItems[indexPath.row]["id"]!)!
        cell.moveButton.tag = Int(CSData.savedItems[indexPath.row]["id"]!)!
        cell.delegate = self
        //cell.backgroundColor = .clear
        
        return cell
    
    }
    
    
}

extension SavedTableViewController : UITableViewDelegate {
    
    
}
