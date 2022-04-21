//
//  CartEmergencyViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/17/22.
//

import UIKit

class CartEmergencyViewController: UIViewController {

    @IBOutlet weak var deleteAllUsersButton: UIButton!
    @IBOutlet weak var getAllUsersButton: UIButton!
    @IBOutlet weak var deleteReceiversButton: UIButton!
    @IBOutlet weak var deleteBillingsButton: UIButton!
    @IBOutlet weak var deleteOrdersButton: UIButton!
    @IBOutlet weak var fetchOrdersButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupButton(deleteAllUsersButton)
        setupButton(getAllUsersButton)
        setupButton(deleteReceiversButton)
        setupButton(deleteBillingsButton)
        setupButton(deleteOrdersButton)
        setupButton(fetchOrdersButton)
        
    }
    
    @IBAction func deleteAllUsers(_ sender: UIButton) {
        
        let success = CartHelper.inst.emergencyDeleteAllUsers()
        
        if success == true {
            print("No More Users!")
        } else {
            print("There are users left.")
          }
        
    }
    
    @IBAction func getAllUsers(_ sender: UIButton) {
        
        let oInfo = CartHelper.inst.fetchOrderInfo(email: "mllsumulong@gmail.com")!
        
        print("SAVED ORDERS: ")
        for i in 0...oInfo.count-1 {
            print("\n==========\(i)==========")
            print(oInfo[i]["billingAddress"]!)
            print(oInfo[i]["shippingAddress"]!)
            print(oInfo[i]["payOption"]!)
            print(oInfo[i]["status"]!)
            print(oInfo[i]["trackingInfo"]!)
            print(oInfo[i]["shippingOption"]!)
            //print(oInfo[i]["cart"]!)
        }
        
    }
    
    func setupButton(_ button: UIButton) {
        
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(named: "DarkRed")?.cgColor
        button.layer.borderWidth = 1
        
    }

    @IBAction func deleteReceivers(_ sender: UIButton) {
        
        let success = CartHelper.inst.emergencyDeleteAllReceivers()
        
        if success == true {
            print("No More Receivers!")
        } else {
            print("There are receivers left.")
          }
        
    }
    
    @IBAction func deleteBillings(_ sender: UIButton) {
        
        let success = CartHelper.inst.emergencyDeleteAllBillings()
        
        if success == true {
            print("No More Payment Info!")
        } else {
            print("There are payment left.")
          }
        
    }
    
    @IBAction func deleteOrders(_ sender: UIButton) {
        
        let success = CartHelper.inst.emergencyDeleteAllOrders()
        
        if success == true {
            print("No More Orders!")
        } else {
            print("There are orders left.")
          }
        
    }
    
    @IBAction func getOrders(_ sender: UIButton) {
        
        let success = CartHelper.inst.fetchOrderInfo(email: "mllsumulong@gmail.com")
        
    }
}
