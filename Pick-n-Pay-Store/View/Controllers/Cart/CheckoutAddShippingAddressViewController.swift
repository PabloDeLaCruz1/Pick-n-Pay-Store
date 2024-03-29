//
//  CheckoutAddShippingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit
import SwiftUI

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
    var isDefault = "0"
    @Environment (\.currentUser) var currentUser
    var recInfo : [String : String] = [:]
    enum status {
        case normal
        case update
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
        
    }

    @IBAction func toggleDefaultButton(_ sender: UIButton) {
        
        if sender.currentBackgroundImage!.description.contains("Unselected") == true {
            sender.setBackgroundImage(UIImage(named: "checkboxSelected"), for: .normal)
            isDefault = "1"
        } else {
            sender.setBackgroundImage(UIImage(named: "checkboxUnselected"), for: .normal)
            isDefault = "0"
          }
    
    }
    
    @IBAction func saveShippingAddress(_ sender: UIButton) {
        
        //INPUT VALIDATION
        if (firstName.text! == "" || lastName.text! == "" || streetNumber.text! == "" || stateLabel.text! == "" || cityLabel.text! == "" || zipLabel.text! == "" || phoneNumber.text! == "")  { // IF EMPTY
            showDialog(message: "Please fill all required information", from: "error")
        } else {
            
            //For concatenation when saving the address information
            var address = [streetNumber.text!]
            if aptNumber.text! != "" {
                address.append(aptNumber.text!)
            }
            address.append(cityLabel.text!)
            address.append(stateLabel.text!+" "+zipLabel.text!)
            
            recInfo = [
                "firstName" : firstName.text!,
                "lastName" : lastName.text!,
                "shippingAddress": address.joined(separator: ", "),
                "phoneNumber" : phoneNumber.text!,
                "sender" : currentUser.email!,
                "isDefault" : isDefault
            ]
            
            //CHECK IF THERE IS ALREADY A DEFAULT ADDRESS SAVED FOR CURRENT USER
            
            if isDefault == "1" {
                
                savingShippingWithDefault()
                
            } else {
                
                if CSData.receiversInfo.isEmpty == true {
                    recInfo["isDefault"] = "1"
                }
                savingWithNoDefault(state : .normal)
                
              }
            
          }
        
    }
    
    func savingShippingWithDefault() {
        
        let noDefault = CartHelper.inst.checkUserDefaultAddress(email: currentUser.email!)
        
        if noDefault == 0 { //No saved shipping address thus making this the default
            
            recInfo["isDefault"] = "1"
            savingWithNoDefault(state: .normal)
            
        } else if noDefault == 1 {
            
            showDialog(message: "There is already an existing default address. Do you want to change the default address to this address?", from: "update")
        
        } else {
            
            showDialog(message: "Error In Database. Please contact customer service at 1-800-1234567", from: "error")
            
         }
        
    }
    
    func savingWithNoDefault(state : status) {
        
        switch state {
            
            case .normal:
                let isAdded = CartHelper.inst.addCartReceivers(recInfo: recInfo)
                if isAdded == true {
                   showDialog(message: "New Shipping Address Saved! Will redirect you to list after clicking OK.", from: "toreturn")
                } else {
                    showDialog(message: "Error In Database. Please contact customer service at 1-800-1234567", from: "error")
                  }
            case .update:
                let isUpdated = CartHelper.inst.updateDefaultAdressForNewAddress(email: currentUser.email!, recInfo: recInfo)
                if isUpdated == true {
                   showDialog(message: "New Shipping Address Saved! Will redirect you to list after clicking OK.", from: "toreturn")
                } else {
                    showDialog(message: "Error In Database. Please contact customer service at 1-800-1234567", from: "error")
                  }
            
        }
        
    }
    
    func showDialog(message : String, from : String) {
        
        let dialogMessage = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        switch from.lowercased() {
            
            case "update":
                let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                    self.savingWithNoDefault(state: .update)
                })
                let no = UIAlertAction(title: "No", style: .default, handler: { (action) -> Void in
                   
                })
                dialogMessage.addAction(yes)
                dialogMessage.addAction(no)
            case "toreturn":
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    self.navigationController?.popViewController(animated: true)
                })
                dialogMessage.addAction(ok)
            default:
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                   
                })
                dialogMessage.addAction(ok)
            
        }
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
}
