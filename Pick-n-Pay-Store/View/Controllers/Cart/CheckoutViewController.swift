//
//  CheckoutViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/14/22.
//

import UIKit
import SwiftUI

class CheckoutViewController: UIViewController, PlaceOrderFunctions, ShippingOptionsFunctions {

    @IBOutlet weak var checkoutTableView: UITableView!
    @Environment(\.currentUser) var currentUser
    
    let initData = CSData()
    
    var existingReceivers : [[String : String]] = []
    var existingPayment : [[String : String]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTable()
        self.title = "Place Your Order"
        reloadView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        reloadView()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        reloadView()
        
    }
    
    func reloadView() {
        
        existingReceivers = CartHelper.inst.fetchReceiversInfo(email: currentUser.email!)!
        existingPayment = CartHelper.inst.fetchPaymentInfo(email: currentUser.email!)!
        
        if existingReceivers.isEmpty == false {
        
            let recInfo = CartHelper.inst.getUserDefaultAddress(email: currentUser.email!)
            
            if recInfo?.isEmpty == false {
                
                initData.setupDefaultAddress(recInfo : recInfo!)
                checkoutTableView.reloadData()
                
            }
            
        }
        
        if existingPayment.isEmpty == false {
        
            let payInfo = CartHelper.inst.getUserDefaultPayment(email: currentUser.email!)
            
            if payInfo?.isEmpty == false {
                
                initData.setupDefaultPayment(payInfo: payInfo!)
                checkoutTableView.reloadData()
                
            }
            
        }
        
    }

    func setupTable() {
        
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self
        
        checkoutTableView.register(UINib(nibName: "CheckoutCartTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutTableViewCell")
        checkoutTableView.register(UINib(nibName: "CartTotalTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTotalTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutButtonTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutShippingTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutShippingTableViewCell")
        checkoutTableView.register(UINib(nibName: "CheckoutBillingTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutBillingTableViewCell")
        checkoutTableView.register(UINib(nibName: "CartShippingOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "CartShippingOptionsTableViewCell")
        
        //makes sure the table is visible
        
        self.checkoutTableView.contentInset.bottom = self.tabBarController?.tabBar.frame.height ?? 0
        
    }
    
    func placeOrder() {
        
        //GET SHIPPING ADDRESS
        var ship : String = ""
        if CSData.selectedAddress.isEmpty == false {
            ship = CSData.selectedAddress["shippingAddress"]!
        } else {
            ship = CSData.defaultAddress["shippingAddress"]!
          }
        
        //GET PAYMENT METHOD
        var payOption = ""
        var bill = ""
        if CSData.selectedPayment.isEmpty == false {
            bill = CSData.selectedPayment["billingAddress"]!
            payOption = CSData.selectedPayment["creditCard"]!
        } else {
            bill = CSData.defaultPayment["billingAddress"]!
            payOption = CSData.defaultPayment["creditCard"]!
          }
        
        //SET TRACKING INFO
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        let strDate = formatter.string(from: date)
        
        //SAVE TO DATABASE
        
        let myOrders = OrderInfo(shippingAddress : ship, billingAddress : bill, payOption : payOption, cart : CSData.cartItems, status : "Bought", shippingOption : CSData.selectedShippingOption, trackingInfo : strDate+":Ordered", balance : CSData.cartTotal)
        
        let success = CartHelper.inst.addToOrder(email: currentUser.email!, orderInfo: myOrders)
        
        if success == true {
            
            var temp : [Bool] = []
            
            for n in 0...CSData.cartItems.count-1 {
                
                let del = CartHelper.inst.deleteFromCartSaved(email: currentUser.email!, itemCart: CSData.cartItems[n])
                
                temp.append(del!)
                
            }
            
            if true {
                                        
                CSData.cartItems.removeAll()
                //showDialog(message: "Order Successful!", from: "")
                //self.performSegue(withIdentifier: "ShowOrder", sender: self)
                tabBarController?.selectedIndex = 4
                
                
            } else {
                
                showDialog(message: "Error In Database", from: "")
            
              }
            
            
        } else {
            
            showDialog(message: "Order Not Successful!", from: "")
        
          }
        
    }
    
    func showDialog(message : String, from : String) {
        
        let dialogMessage = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
           
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func resetShipOptionCell() {
        
        for j in 0...CSData.shippingOptions.count-1 {
            
            let indexPath = IndexPath(row: j, section: 3)
            let cell = checkoutTableView.cellForRow(at: indexPath) as? CartShippingOptionsTableViewCell
            cell?.circleButton.setBackgroundImage(UIImage(named: "circleUnselected"), for: .normal)

        }
        
    }
    
}

extension CheckoutViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {

            case 0:
                return 1
            case 3:
                return CSData.shippingOptions.count
            case 4:
                return CSData.cartItems.count
            default:
                return 1

        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

            case 0: //ORDER TOTAL
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CartTotalTableViewCell", for: indexPath) as! CartTotalTableViewCell
                
                return cell
            
            case 1: //SHIPPING ADDRESS
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutShippingTableViewCell", for: indexPath) as! CheckoutShippingTableViewCell
                
                cell.accessoryType = .disclosureIndicator
            
                if existingReceivers.isEmpty == false {
                
                    // FOR PROTECTION
                    
                    cell.receiverLabel.isHidden = false
                    cell.shippingButton.isHidden = true
                    
                    //AUTO-POPULATE CELL OBJECTS
                    if CSData.selectedAddress.isEmpty == true {
                        cell.receiverName.text = CSData.defaultAddress["firstName"]! + " " + CSData.defaultAddress["lastName"]!
                        cell.receiverAddress.text = CSData.defaultAddress["shippingAddress"]!
                    } else {
                        cell.receiverName.text = CSData.selectedAddress["firstName"]! + " " + CSData.selectedAddress["lastName"]!
                        cell.receiverAddress.text = CSData.selectedAddress["shippingAddress"]!
                    }
                
                    return cell
                
                } else {

                    cell.receiverLabel.isHidden = true
                    cell.shippingButton.isHidden = false
                    
                    return cell
                    
                  }
            
            case 2: //BILLING ADDRESS
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutBillingTableViewCell", for: indexPath) as! CheckoutBillingTableViewCell
                
                cell.accessoryType = .disclosureIndicator
                
                if existingPayment.isEmpty == false {
                    
                    //FOR PROTECTION
                    
                    cell.paymentStackView.isHidden = false
                    cell.paymentButton.isHidden = true
                    
                    var cardType : String = ""
                    var cardNum = "XXXX"
                    
                    if CSData.selectedPayment.isEmpty == true {
                        
                        cell.billingAddress.text = CSData.defaultPayment["billingAddress"]!
                    
                        cardType = getCardType(card: String((CSData.defaultPayment["creditCard"]?.prefix(1))!))
                        cardNum += (CSData.defaultPayment["creditCard"]!.suffix(4))
                        cell.paymentMethod.text = cardType+" "+cardNum
                        
                    } else {
                        
                        if CSData.selectedPayment["billingAddress"]! != "" {
                        
                            cell.billingAddress.text = CSData.selectedPayment["billingAddress"]!
                            cell.billingAddress.isHidden = false
                            cell.billingAddressTitle.isHidden = false
                            
                            cardType = getCardType(card: String((CSData.selectedPayment["creditCard"]?.prefix(1))!))
                            cardNum += (CSData.selectedPayment["creditCard"]!.suffix(4))
                            cell.paymentMethod.text = cardType+" "+cardNum
                            
                        } else {
                          
                            cell.billingAddress.isHidden = true
                            cell.billingAddressTitle.isHidden = true
                            cell.paymentMethod.text = CSData.selectedPayment["creditCard"]!
                            
                          }
                    
                    }
                
                    return cell
                    
                    
                } else if CSData.selectedPayment.isEmpty == false {
                    
                    cell.paymentStackView.isHidden = false
                    cell.billingAddress.isHidden = true
                    cell.billingAddressTitle.isHidden = true
                    cell.paymentMethod.text = CSData.selectedPayment["creditCard"]!
                    cell.paymentButton.isHidden = true
                    
                    return cell
                    
                  } else {

                        cell.paymentStackView.isHidden = true
                        cell.paymentButton.isHidden = false

                        return cell

                    }
            case 3: //SHIPPING OPTIONS
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CartShippingOptionsTableViewCell", for: indexPath) as! CartShippingOptionsTableViewCell
                
                cell.shippingOption.text = "\(CSData.shippingOptions[indexPath.row]["type"]!) (\(CSData.shippingOptions[indexPath.row]["length"]!) day/s)"
                cell.shippingOption.tag = indexPath.row
                cell.circleButton.tag = indexPath.row
        
                //SET DEFAULT
                if CSData.selectedShippingOption.isEmpty == true {
                    CSData.selectedShippingOption["type"] = CSData.shippingOptions[indexPath.row]["type"]!
                    CSData.selectedShippingOption["length"] = CSData.shippingOptions[indexPath.row]["length"]!
                    cell.circleButton.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
                } else {
                    if CSData.selectedShippingOption["type"] == CSData.shippingOptions[indexPath.row]["type"]! {
                        cell.circleButton.setBackgroundImage(UIImage(named: "circleSelected"), for: .normal)
                    }
                  }
            
                cell.delegate = self
            
                return cell
            
            case 4: //CART ITEMS
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutCartTableViewCell
            
                cell.checkoutImg.image = UIImage(named: CSData.cartItems[indexPath.row]["image"]!)
                cell.checkoutDesc.text = CSData.cartItems[indexPath.row]["desc"]!
                cell.checkoutPrice.text = "$"+CSData.cartItems[indexPath.row]["price"]!
                cell.checkoutStepperLabel.text = CSData.cartItems[indexPath.row]["quantity"]!
                cell.checkoutStepper.value = Double(CSData.cartItems[indexPath.row]["quantity"]!)!
                
                return cell
            
            default: //PLACE YOUR ORDER BUTTON

                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutButtonTableViewCell", for: indexPath) as! CheckoutButtonTableViewCell
            
            if (CSData.defaultPayment.isEmpty == true || CSData.defaultAddress.isEmpty == true) && CSData.selectedPayment.isEmpty == true {
                    
                    cell.pyoButton.backgroundColor = .gray
                    cell.pyoButton.isUserInteractionEnabled = false
                    
                } else {
                    
                    cell.pyoButton.backgroundColor = UIColor(named: "DustyRose")
                    cell.pyoButton.isUserInteractionEnabled = true
                    
                  }
            
                cell.delegate = self
            
                return cell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sec : String
        
        switch section {
            
            case 1:
                sec = "Shipping Address"
            case 2:
                sec = "Payment Information"
            case 3:
                sec = "Shipping Options"
            case 4:
                sec = "Shipment Details"
            default:
                sec = ""
            
        }
        
        return sec
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            
            case 1:
                performSegue(withIdentifier: "ShippingScreen", sender: self)
            case 2:
                performSegue(withIdentifier: "BillingScreen", sender: self)
            default:
                print("No choice!")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        switch indexPath.section {
            
            case 5:
                return false
            default:
                return true
            
        }
        
    }
}

extension CheckoutViewController : UITableViewDelegate {
    
    func getCardType(card : String) -> String {
        
        var cardType = ""
        
        switch card {

            case "3":
                cardType = "AMEX"

            case "4":
                cardType = "Visa"
            case "5":
                cardType = "MasterCard"
            default:
                cardType = "Discover"

        }
        
        return cardType
        
    }
    
}
