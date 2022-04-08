//
//  CartSavedViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/7/22.
//

import UIKit

class CartSavedViewController: UIViewController {
    
    @IBOutlet weak var cartSaveSC: UISegmentedControl!
    @IBOutlet weak var pageView: UIView!
    
    var seg : UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cartSaveSC.selectedSegmentIndex = CSData.selIndex
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
        //self.navigationController?.navigationBar.backgroundColor = UIColor(named: "Coral")
        
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        
        if (CSData.cartItems.count != 0) {
            sender.setTitle("Your Cart (\(CSData.cartItems.count-1))", forSegmentAt: 0)
        } else {
            sender.setTitle("Your Cart (\(CSData.cartItems.count))", forSegmentAt: 0)
          }
        sender.setTitle("Saved (\(CSData.savedItems.count))", forSegmentAt: 1)
        
        CSData.selIndex = sender.selectedSegmentIndex
        
        switch sender.selectedSegmentIndex {
            
            case 0:
                if CSData.cartItems.count == 0 || CSData.cartItems.count == 1 {
                    resetPageView()
                    let newPage = CSData()
                    newPage.drawEmptyCartSavedPage(view: pageView, segment: "carts")
                } else {
                    resetPageView()
                    drawCartItem()
                  }
            default:
                if CSData.savedItems.count == 0 {
                    resetPageView()
                    let newPage = CSData()
                    newPage.drawEmptyCartSavedPage(view: pageView, segment: "saved")
                } else {
                    resetPageView()
                    drawSavedItem()
                  }
            
        }
        
    }
    
    func resetPageView() {
        
        pageView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
    }
    
    func drawSavedItem() {
        
        let svc = SavedTableViewController()
        addChild(svc)
        pageView.addSubview(svc.view)
        svc.didMove(toParent: self)
        
    }
    
    func drawCartItem() {
        
        let tvc = CartTableViewController()
        addChild(tvc)
        pageView.addSubview(tvc.view)
        tvc.didMove(toParent: self)
        
    }

}
