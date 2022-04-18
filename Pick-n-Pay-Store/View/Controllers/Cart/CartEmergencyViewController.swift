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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupButton(deleteAllUsersButton)
        setupButton(getAllUsersButton)
        
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

}
