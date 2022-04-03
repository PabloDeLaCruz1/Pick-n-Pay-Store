//
//  OrderTestViewController.swift
//  Pick-n-Pay-Store
//
//  Created by admin on 4/1/22.
//
import SQLite3
import UIKit
import Foundation


class OrderTestViewController: UIViewController {

    @IBOutlet weak var shippingOptionButton: UIButton!
    @IBOutlet weak var payOptionButton: UIButton!
    @IBOutlet weak var billingAddresstf: UITextField!
    @IBOutlet weak var shippingAddresstf: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    
    enum TypeOfShipping: String, CaseIterable{
        case Overnight="Overnight"
        case Express="Express"
        case Standard="Standard"
        case COD = "Cash on Delivery"
        case POD = "Payment on Delivery"
        case CC = "Credit Card"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shippingOptionButton.showsMenuAsPrimaryAction=true
        shippingOptionButton.menu=addshippingMenuItems()
        
        payOptionButton.showsMenuAsPrimaryAction=true
        payOptionButton.menu=addpayMenuItems()
    }
    
    func addshippingMenuItems()->UIMenu{
        let menuItems = UIMenu(title: "Shipping Options", options: .displayInline, children: [
            UIAction(title: "Standard", image: UIImage(systemName: "figure.walk")){ _ in
                self.shippingOptionButton.setTitle(TypeOfShipping.Standard.rawValue, for: .normal)
            },
            UIAction(title: "Express", image: UIImage(systemName: "car.fill")){_ in
                self.shippingOptionButton.setTitle(TypeOfShipping.Express.rawValue, for: .normal)
            },
            UIAction(title: "Overnight", image: UIImage(systemName: "moon.zzz.fill")){_ in
                self.shippingOptionButton.setTitle(TypeOfShipping.Overnight.rawValue, for: .normal)
            }
        ])
        return menuItems
    }
    
    func addpayMenuItems()->UIMenu{
        let menuItems = UIMenu(title: "Payment Options", options: .displayInline, children: [
            UIAction(title: "Payment on Delivery", image: UIImage(systemName: "dollarsign.circle")){ _ in
                self.payOptionButton.setTitle(TypeOfShipping.POD.rawValue, for: .normal)
            },
            UIAction(title: "Cash on Delivery", image: UIImage(systemName: "dollarsign.circle.fill")){_ in
                self.payOptionButton.setTitle(TypeOfShipping.COD.rawValue, for: .normal)
            },
            UIAction(title: "Credit Card", image: UIImage(systemName: "creditcard.fill")){_ in
                self.payOptionButton.setTitle(TypeOfShipping.CC.rawValue, for: .normal)
            }
        ])
        return menuItems
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
