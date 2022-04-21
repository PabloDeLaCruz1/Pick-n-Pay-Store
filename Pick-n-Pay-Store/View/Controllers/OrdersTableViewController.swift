//
//  OrdersTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/12/22.
//

import UIKit
import SwiftUI

class OrdersTableViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let orderCons = MyOrders()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "My Orders"
        setupTable()
        reloadOrderView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        reloadOrderView()

    }
    
    override func viewWillLayoutSubviews() {
        
        reloadOrderView()
        
    }
    
    func setupTable() {
        
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
        
    }
    
    func reloadOrderView() {
        
        let orderData = OrdersHelper.inst.fetchOrderInformation(email: currentUser.email!)
        
        if orderData?.isEmpty == false {
            
            orderCons.setupOrderItems(orders: orderData!)
            
        }
        
        orderTableView.reloadData()
        
    }

}

extension OrdersTableViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MyOrders.myOrders.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        
        cell.orderDesc.text = MyOrders.myOrders[indexPath.row]["desc"]!
        cell.itemImage.image = UIImage(named: MyOrders.myOrders[indexPath.row]["image"]!)
        cell.trackingStatus.text = "Estimated Delivery: April 28, 2022"
        
        return cell
        
        
    }

}

extension OrdersTableViewController : UITableViewDelegate {



}

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return ODData.savedItems.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Shipping and Billing Details and Balance"
//
//                cell.nameOrder.text = ODData.savedItems[indexPath.row]["desc"]!
//                cell.imageOrder.image = UIImage(named: ODData.savedItems[indexPath.row]["image"]!)
//                cell.balanceOrder.text = "$" + ODData.savedItems[indexPath.row]["price"]!
//                cell.quantityOrder.text = "x" + ODData.savedItems[indexPath.row]["quantity"]!
//                return cell
//
//            }
//            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                return 230   }
//
//
//            override func viewDidLoad() {
//                super.viewDidLoad()
