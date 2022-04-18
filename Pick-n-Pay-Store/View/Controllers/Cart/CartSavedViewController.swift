//
//  CartSavedViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit
import SwiftUI

class CartSavedViewController: UIViewController{
    
    @IBOutlet weak var cartSaveSC: UISegmentedControl!
    @IBOutlet weak var pageView: UIView!
    @Environment(\.currentUser) var currentUser
    
    //var seg : UISegmentedControl!
    
    let testData = CSData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        cartSaveSC.selectedSegmentIndex = CSData.selIndex
        
        //FETCH CART INFORMATION FROM COREDATA
        let mainItems = CartHelper.inst.fetchUserCart(email: currentUser.email!)
        if mainItems != nil {
            testData.setupCartSavedItems(items: mainItems!)
        }
        
        setupSegmentedControl()
        setupNavigationBar()
        cartSaveSC.sendActions(for: UIControl.Event.valueChanged)
        
    }
    
    func setupSegmentedControl() {
        
        cartSaveSC.selectedSegmentTintColor = UIColor(named: "RoseQuartz")
        cartSaveSC.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        cartSaveSC.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        
    }
    
    func setupNavigationBar() {
        
        self.title = "Cart"
        self.parent?.navigationController?.navigationBar.barTintColor = UIColor(named: "Coral")
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        
        sender.setTitle("Your Cart (\(CSData.cartItems.count))", forSegmentAt: 0)
        sender.setTitle("Saved (\(CSData.savedItems.count))", forSegmentAt: 1)
        
        CSData.selIndex = sender.selectedSegmentIndex
        
        switch sender.selectedSegmentIndex {
            
            case 0:
                if CSData.cartItems.count == 0 {
                    resetPageView()
                    testData.drawEmptyCartSavedPage(view: pageView, segment: "carts")
                } else {
                    resetPageView()
                    //drawCartItem()
                    drawCartSavedItem(segment: "cart")
                  }
            default:
                if CSData.savedItems.count == 0 {
                    resetPageView()
                    testData.drawEmptyCartSavedPage(view: pageView, segment: "saved")
                } else {
                    resetPageView()
                    drawCartSavedItem(segment: "saved")
                  }
            
        }
        
    }
    
    func resetPageView() {
        
        //this function clear the page view object to draw the table
        //or the empty cart or saved items
        
        pageView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
    }
    
    func drawCartSavedItem(segment : String) {
        
        //this function draws the table for the cart and saved items programmatically
        
        var tvc = UIViewController()
        
        switch segment.lowercased() {
            
            case "cart":
                tvc = CartTableViewController()
            default:
                tvc = SavedTableViewController()
            
        }
        
        addChild(tvc)
        pageView.addSubview(tvc.view)
        tvc.didMove(toParent: self)
        
    }

}
