//
//  CheckoutBillingAddressViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/18/22.
//

import UIKit
import SwiftUI

class CheckoutBillingAddressViewController: UIViewController, PaymentCellFunctions, NewPaymentInformationFunctions {
    
    @IBOutlet weak var paymentInformationTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let paymentData = CSData()
    let oipArray = ["cod","zelle","paypal","venmo","cashapp"]
    let oipLabel = ["Cash On Delivery","Zelle", "Paypal", "Venmo", "Cash App"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Select Payment Method"
        setupTable()
        reloadPaymentMethodsView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        reloadPaymentMethodsView()
        
    }
    
    func setupTable() {
        
        paymentInformationTableView.delegate = self
        paymentInformationTableView.dataSource = self
        paymentInformationTableView.register(UINib(nibName: "CheckoutPaymentInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutPaymentInformationTableViewCell")
        paymentInformationTableView.register(UINib(nibName: "CheckoutAddBillingAddressButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutAddBillingAddressButtonTableViewCell")
        paymentInformationTableView.register(UINib(nibName: "CheckoutOtherPaymentMethodTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutOtherPaymentMethodTableViewCell")
        self.paymentInformationTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    func resetPaymentCellState() {
        
        //this function is for the recipients tableview cell, to be in their default before the button is clicked
        
        if CSData.paymentsInfo.isEmpty == false {
            
            for j in 0...CSData.paymentsInfo.count-1 {
                
                let indexPath = IndexPath(row: j, section: 0)
                let cell = paymentInformationTableView.cellForRow(at: indexPath) as? CheckoutPaymentInformationTableViewCell
                cell?.paymentMethodButton.isHidden = true
                cell?.circleButton.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)

            }
            
        }
        
        for j in 0...4 {
            
            let indexPath = IndexPath(row: j, section: 1)
            let cell = paymentInformationTableView.cellForRow(at: indexPath) as? CheckoutOtherPaymentMethodTableViewCell
            cell?.selectedPaymentMethodButton.isHidden = true
            cell?.circleButton.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)

        }
        
        
    }
    
    func goToAddPayment() {
        
        self.performSegue(withIdentifier: "AddBilling", sender: self)
        
    }
    
    func reloadPaymentMethodsView() {
        
        let payInfo = CartHelper.inst.fetchPaymentInfo(email: currentUser.email!)
        
        if payInfo != nil {
            
            paymentData.setupPaymentsInfo(payInfo: payInfo!)
            paymentInformationTableView.reloadData()
            
        }
        
    }
    
    func returnToCheckoutPage() {
        
        self.navigationController?.popViewController(animated: true)
        
    }

}

extension CheckoutBillingAddressViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
            case 0:
                return CSData.paymentsInfo.count
            case 1:
                return oipArray.count
            default:
                return 1
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutPaymentInformationTableViewCell", for: indexPath) as! CheckoutPaymentInformationTableViewCell
            
            
                let fullname = CSData.paymentsInfo[indexPath.row]["firstName"]!+" "+CSData.paymentsInfo[indexPath.row]["lastName"]!
            
                var cardType : String = ""
                
                switch CSData.paymentsInfo[indexPath.row]["creditCard"]?.prefix(1) {
                    
                    case "3":
                        cardType = "AMEX"
                    case "4":
                        cardType = "Visa"
                    case "5":
                        cardType = "MasterCard"
                    default:
                        cardType = "Discover"
                    
                }
            
                cell.creditCardNumber.text = cardType+" XXXX"+(CSData.paymentsInfo[indexPath.row]["creditCard"]?.suffix(4))!
                cell.accountHolder.text = fullname
                cell.expirationDate.text = "Expires on \(String(describing: CSData.paymentsInfo[indexPath.row]["expirationDate"]!))"
                cell.paymentMethodButton.tag = indexPath.row
                cell.delegate = self
            
                return cell
            
            case 1:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutOtherPaymentMethodTableViewCell", for: indexPath) as! CheckoutOtherPaymentMethodTableViewCell
                
                cell.oipImage.image = UIImage(named: oipArray[indexPath.row])
                cell.oipLabel.text = oipLabel[indexPath.row]
                cell.selectedPaymentMethodButton.tag = indexPath.row
                cell.otherDelegate = self
            
                return cell
            
            default:

                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutAddBillingAddressButtonTableViewCell", for: indexPath) as! CheckoutAddBillingAddressButtonTableViewCell
                
                cell.delegate = self
            
                return cell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
            case 1:
                return "OTHER PAYMENT METHODS"
            default:
                return ""
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
            case 1:
                return 90
            case 2:
                return 60
            default:
                return 140
            
        }
        
    }
    
}

extension CheckoutBillingAddressViewController : UITableViewDelegate {
    
}
