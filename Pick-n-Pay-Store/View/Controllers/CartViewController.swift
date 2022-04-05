//
//  CartViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Maricel Sumulong on 4/5/22.
//

import UIKit

class CartViewController: UIViewController {

    var cartNum = 1
    var savedItems = 1
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    let mySegmentedControl = UISegmentedControl(items: ["Your Cart","Saved"])
    
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
        
        //print("Cart and Saved Items are filled")
        //let mySegmentedControl = UISegmentedControl (items: ["One","Two","Three"])
                
        let xPostion:CGFloat = -5
        let yPostion:CGFloat = (self.navigationController?.navigationBar.frame.height)! + 47
        let elementWidth:CGFloat = screenSize.width + 10
        let elementHeight:CGFloat = 35

        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)

        // Make second segment selected
        mySegmentedControl.selectedSegmentIndex = 0

        //Change UISegmentedControl background colour
        //mySegmentedControl.selectedSegmentTintColor = .purple

        mySegmentedControl.layer.cornerRadius = 0.0
        //mySegmentedControl.clipsToBounds = true

        //Change text color of UISegmentedControl
        mySegmentedControl.tintColor = .clear

        //Unselected
        mySegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)

        mySegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black
            ], for: .selected)

        // Add function to handle Value Changed events
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)

        self.view.addSubview(mySegmentedControl)
        
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        
        switch sender.selectedSegmentIndex {
            
            case 0:
                print("Zero Selected Segment Index is : \(sender.selectedSegmentIndex)")
            default:
                print("One Selected Segment Index is : \(sender.selectedSegmentIndex)")
            
        }
        
        
    }

}

