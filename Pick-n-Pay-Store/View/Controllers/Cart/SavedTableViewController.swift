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
        
        self.view.addSubview(savedTableView) //adds the tableview object
        
        //next 5 lines setups the constraints of the table
        
        savedTableView.translatesAutoresizingMaskIntoConstraints = false
        savedTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        savedTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        savedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        savedTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //the following line makes sure the whole table is visible
        
        self.savedTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    func updateTable() {
        
        //this function is called when user selects an item to be moved back
        //triggered from table view cell
        
        self.view.subviews.forEach{ //clears the view object
            $0.removeFromSuperview()
        }
        
        if (CSData.savedItems.count > 0) {
            setupTableView()
            savedTableView.reloadData()
        } else {
            let newPage = CSData()
            newPage.drawEmptyCartSavedPage(view: self.view, segment: "saved")
          }
        
        self.parent?.viewWillAppear(false) //updates the number in the UISegmentControl title
    
    }

}

extension SavedTableViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CSData.savedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
        
        cell.savedItemImg.image = UIImage(named: CSData.savedItems[indexPath.row]["image"]!)
        cell.savedItemDesc.text = CSData.savedItems[indexPath.row]["desc"]!
        cell.savedItemPrice.text = "$"+CSData.savedItems[indexPath.row]["price"]!
        cell.savedItemStepperLabel.text = CSData.savedItems[indexPath.row]["quantity"]!
        cell.savedItemStepper.value = Double(CSData.savedItems[indexPath.row]["quantity"]!)!
        
        // the tags are used as marks for the remove and move-back-to-cart functions
        
        cell.removeSavedButton.tag = Int(CSData.savedItems[indexPath.row]["id"]!)!
        cell.moveButton.tag = Int(CSData.savedItems[indexPath.row]["id"]!)!
        cell.savedItemStepper.tag = Int(CSData.savedItems[indexPath.row]["id"]!)!
        
        //declared to be able to use a function declared in this class using the table view cell
        
        cell.delegate = self
        
        return cell
    
    }
    
    
}

extension SavedTableViewController : UITableViewDelegate {
    
    
}
