//
//  CartViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartViewController: UIViewController {

    var cartNum = 0
    var savedItems = 0
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    let segmentControl = UISegmentedControl(items: ["Cart","Saved"])
    
    override func viewDidLoad() {
           
        super.viewDidLoad()
        self.title = "Cart"
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        
        if cartNum == 0 && savedItems == 0 {
            drawEmptyCart()
        } else if cartNum > 0 && savedItems == 0 {
            drawCart()
          } else {
              drawSegmentedControl()
            }
        
        
        
    }
    
    func drawEmptyCart() {
        
        let img = UIImageView()
        img.image = UIImage(named: "cart")
        let x = (screenWidth/2) - 120
        img.frame = CGRect(x: x, y: 256, width: 230, height: 230)
        view.addSubview(img)
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 230),
            img.heightAnchor.constraint(equalToConstant: 230),
            img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -107)
        ])
        let lbl = UILabel()
        lbl.text = "Your shopping cart is empty"
        lbl.font = UIFont(name: "Hiragino Mincho ProN", size: 25)
        lbl.frame = CGRect(x: 32.5, y:522, width: 333, height: 25)
        view.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 76.5)
        ])
        
    }
    
    func drawCart() {
        
        print("Saved Item Is Empty. Cart Only")
        
    }
    
    func drawSegmentedControl() {
        
        print("Cart and Saved Items are filled")
        
    }

}

