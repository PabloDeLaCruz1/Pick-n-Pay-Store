//
//  CartViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartSaveSC: UISegmentedControl!
    @IBOutlet weak var pageView: UIView!
    var cartNum = 0
    var savedItems = 1
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        setupSegmentedControl()
        setupNavigationBar()
        setupPageView()
        
    }
    
    func setupSegmentedControl() {
        
        cartSaveSC.selectedSegmentTintColor = .clear
        cartSaveSC.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        cartSaveSC.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        
    }
    
    func setupNavigationBar() {
        
        self.title = "Cart"
        
    }
    
    func setupPageView() {
        
        cartSaveSC.setTitle("Your Cart (\(cartNum))", forSegmentAt: 0)
        cartSaveSC.setTitle("Saved (\(cartNum))", forSegmentAt: 1)
        
        switch cartSaveSC.selectedSegmentIndex {
            
            case 0:
                print("Zero Selected Index")
                if cartNum == 0 {
                    drawEmptyCart()
                } else {
                    let tvc = CartTableViewController()
                    addChild(tvc)
                    //pageView.removeFromSuperview()
                    //pageView = UIView()
                    //tvc.preferredContentSize.width = screenWidth + 10
                    pageView.addSubview(tvc.view)
                    tvc.didMove(toParent: self)
                    
//                    addChild(tvc)
//                    //tvc.view.frame = frame
//
//                    self.view.addSubview(tvc.view)
//                    tvc.didMove(toParent: self)
                  }
            default:
                print("One Selected Index")
            
        }
        
    }
    
    func drawEmptyCart() {
        
        let img = UIImageView()
        img.image = UIImage(named: "cart")
        let x = (screenWidth/2) - 120
        img.frame = CGRect(x: x, y: 156, width: 230, height: 230)
//        pageView.backgroundColor = UIColor.red
        pageView.addSubview(img)
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 230),
            img.heightAnchor.constraint(equalToConstant: 230),
            img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -7)
        ])
        let lbl = UILabel()
        lbl.text = "Your shopping cart is empty"
        lbl.font = UIFont(name: "Hiragino Mincho ProN", size: 25)
        lbl.frame = CGRect(x: 32.5, y:422, width: 333, height: 25)
        pageView.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -176.5)
        ])
        
        self.view.addSubview(pageView)
        
    }
    
}



