//
//  OrdersTableViewController.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/12/22.
//

import UIKit

class OrdersTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CSData.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Shipping and Billing Detaisl"
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrdersTableViewCell
        
        
        
        cell.nameOrder.text = CSData.cartItems[indexPath.row]["description"]!
        cell.imageOrder.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
        cell.balanceOrder.text = "$" + CSData.cartItems[indexPath.row]["price"]!
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230   }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
