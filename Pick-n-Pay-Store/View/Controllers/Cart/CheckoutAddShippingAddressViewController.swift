//
//  CheckoutAddShippingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit

class CheckoutAddShippingAddressViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var streetNumber: UITextField!
    @IBOutlet weak var aptNumber: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var zipLabel: UITextField!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    var isDefault = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func toggleDefaultButton(_ sender: UIButton) {
        
        if sender.currentBackgroundImage!.description.contains("Unselected") == true {
            sender.setBackgroundImage(UIImage(named: "checkboxSelected"), for: .normal)
            isDefault = 1
        } else {
            sender.setBackgroundImage(UIImage(named: "checkboxUnselected"), for: .normal)
            isDefault = 0
          }
    
    }
    
    @IBAction func saveShippingAddress(_ sender: UIButton) {
        
       // if firstName.text! == "" || lastName.text! == "" ||
        
        
    }
    
    
    
}
