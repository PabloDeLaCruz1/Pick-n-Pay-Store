//
//  CheckoutAddBillingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit
import SwiftUI

class CheckoutAddBillingAddressViewController: UIViewController {

    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var expirationDate: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var streetNumber: UITextField!
    @IBOutlet weak var aptNumber: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var zipLabel: UITextField!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    var isDefault = "0"
    @Environment (\.currentUser) var currentUser
    var payInfo : [String : String] = [:]
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
    
    @IBAction func savePaymentOption(_ sender: UIButton) {
        
        //INPUT VALIDATION
        if (firstName.text! == "" || lastName.text! == "" || streetNumber.text! == "" || stateLabel.text! == "" || cityLabel.text! == "" || zipLabel.text! == "" || creditCard.text! == "" || expirationDate.text! == "")  { // IF EMPTY
            showDialog(message: "Please fill all required information", from: "error")
        } else {
            
            //CHECK CREDIT FORMAT INFORMATION
            
            let isValid = checkCreditCardInformation()
            
            if isValid == false {
                
                showDialog(message: "Invalid Credit Card Information", from: "error")
                return
                
            }
            
            //CHECK EXPIRATION DATE FORMAT
            
            //For concatenation when saving the address information
            var address = [streetNumber.text!]
            if aptNumber.text! != "" {
                address.append(aptNumber.text!)
            }
            address.append(cityLabel.text!)
            address.append(stateLabel.text!+" "+zipLabel.text!)
            
            payInfo = [
                "firstName" : firstName.text!,
                "lastName" : lastName.text!,
                "billingAddress": address.joined(separator: ", "),
                "sender" : currentUser.email!,
                "isDefault" : isDefault,
                "creditCard" : creditCard.text!,
                "expirationDate" : expirationDate.text!
            ]
            
            //CHECK IF THERE IS ALREADY A DEFAULT ADDRESS SAVED FOR CURRENT USER
            
            if isDefault == "1" {
                
                savingShippingWithDefault()
                
            } else {
                
                if CSData.paymentsInfo.isEmpty == true {
                    payInfo["isDefault"] = "1"
                }
                savingWithNoDefault(state : .normal)
                
              }
            
          }
        
    }
    
    func savingShippingWithDefault() {
        
        let noDefault = CartHelper.inst.checkUserDefaultPayment(email: currentUser.email!)
        
        if noDefault == 0 { //No saved shipping address thus making this the default
            
            payInfo["isDefault"] = "1"
            savingWithNoDefault(state: .normal)
            
        } else if noDefault == 1 {
            
            showDialog(message: "There is already an existing default payment method. Do you want to change the default payment method to this payment method?", from: "update")
        
        } else {
            
            showDialog(message: "Error In Database. Please contact customer service at 1-800-1234567", from: "error")
            
         }
        
    }
    
    func savingWithNoDefault(state : status) {
        
        switch state {
            
            case .normal:
                let isAdded = CartHelper.inst.addCartPayments(payInfo: payInfo)
                if isAdded == true {
                   showDialog(message: "New Payment Method Saved! Will redirect you to list after clicking OK.", from: "toreturn")
                } else {
                    showDialog(message: "Error In Database. Please contact customer service at 1-800-1234567", from: "error")
                  }
            case .update:
                let isUpdated = CartHelper.inst.updateDefaultPaymentForNewPaymentMethod(email: currentUser.email!, payInfo: payInfo)
                if isUpdated == true {
                   showDialog(message: "New Payment Method Saved! Will redirect you to list after clicking OK.", from: "toreturn")
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
                    //self.performSegue(withIdentifier: "shippingReturn", sender: self)
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
    
    func checkCreditCardInformation() -> Bool {
        
        let cc = creditCard.text!
        var isValid = true
        
        //CHECK IF MASTERCARD, VISA, AMEX OR DISCOVERY
        if cc.prefix(1) == "4" || cc.prefix(1) == "5" || cc.prefix(1) == "6" {
            
            if cc.count == 16 { //MASTERCARD, "VISA", "DISCOVERY"
              
                if checkIfNumber(cc: cc) == false {
                    
                    isValid = false
                    
                }
                
            } else {
                
                isValid = false
              
              }
            
        } else if cc.prefix(2) == "34" || cc.prefix(2) == "37" {
            
            if cc.count == 15 { //AMEX
              
                if checkIfNumber(cc: cc) == false {
                    
                    isValid = false
                    
                }
                
            } else {
                
                isValid = false
              
              }
            
          } else {
            
                isValid = false
              
              }
        
        return isValid
    
    }
    
    func checkIfNumber(cc : String) -> Bool {
        
        //https://gist.github.com/iSame7/579f055f37c654061e3c047815eadfe2
        
        for char in cc {
  
            let scalarValues = String(char).unicodeScalars
            let charAscii = scalarValues[scalarValues.startIndex].value
            //ASCII value of 0 = 48, 9 = 57. So if value is outside of numeric range then fail
            //Checking for negative sign "-" could be added: ASCII value 45.
            if charAscii < 48 || charAscii > 57 {
                return false
            }
        
        }
        
        return true
        
    }
    
}
