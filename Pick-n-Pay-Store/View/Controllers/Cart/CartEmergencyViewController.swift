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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupButton(deleteAllUsersButton)
        setupButton(getAllUsersButton)
        setupButton(deleteReceiversButton)
        setupButton(deleteBillingsButton)
        
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
        
        CartHelper.inst.printData()
        
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
    
}
