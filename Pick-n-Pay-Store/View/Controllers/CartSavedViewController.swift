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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cartSaveSC.selectedSegmentIndex = 0
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
    
    func drawEmptyCartSavedPage(segment : String) {
        
        var label : String
        var x1 : CGFloat
        var x2 : CGFloat
        
        switch segment.lowercased() {
            case "carts":
                label = "Your shopping cart is empty"
                x1 = (CSData.screenWidth/2) - 120
                x2 = (CSData.screenWidth/2) - 160
            default:
                label = "Your saved cart is empty"
                x1 = (CSData.screenWidth/2) - 110
                x2 = (CSData.screenWidth/2) - 140
        }
        
        
        let img = UIImageView()
        img.image = UIImage(named: segment)
        img.frame = CGRect(x: x1, y: 156, width: 230, height: 230)
//        pageView.backgroundColor = UIColor.red
        pageView.addSubview(img)
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 230),
            img.heightAnchor.constraint(equalToConstant: 230),
            img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -7)
        ])
        let lbl = UILabel()
        lbl.text = label
        lbl.font = UIFont(name: "Hiragino Mincho ProN", size: 25)
        lbl.frame = CGRect(x: x2, y:422, width: 333, height: 25)
        pageView.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -176.5)
        ])
        lbl.adjustsFontSizeToFitWidth = true
        self.view.addSubview(pageView)
        
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        
        sender.setTitle("Your Cart (\(CSData.cartItems.count-1))", forSegmentAt: 0)
        sender.setTitle("Saved (\(CSData.savedItems.count))", forSegmentAt: 1)
        
        switch sender.selectedSegmentIndex {
            
            case 0:
                print("Zero Selected Index")
                if CSData.cartItems.count == 0 {
                    resetPageView()
                    drawEmptyCartSavedPage(segment: "carts")
                } else {
                    resetPageView()
                    drawCartItem()
                  }
            default:
            if CSData.savedItems.count == 0 {
                resetPageView()
                drawEmptyCartSavedPage(segment: "saved")
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
    
    func drawCartItem() {
        
        let tvc = CartTableViewController()
        addChild(tvc)
        pageView.addSubview(tvc.view)
        tvc.didMove(toParent: self)
        
    }
    
    func drawSavedItem() {
        
        let svc = SavedTableViewController()
        addChild(svc)
        pageView.addSubview(svc.view)
        svc.didMove(toParent: self)
        
    }
    

}
