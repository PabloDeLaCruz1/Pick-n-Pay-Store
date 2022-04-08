//
//  LandingUIKitView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/7/22.
//

import UIKit

class LandingUIKitView: UIView {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var continueGuest: UIButton!
    @IBOutlet weak var login: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var label:UILabel!
   var button:UIButton!

   override init (frame : CGRect) {
       super.init(frame : frame)
       self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)


       label = UILabel(frame: CGRect(x: 12, y: 8, width: self.frame.size.width-90, height: 50))
       label.text = "Connection error please try again later!!"
       label.textColor = UIColor.white
       label.numberOfLines = 0
       label.font = UIFont.systemFont(ofSize: 14)
       self.addSubview(label)

       button = UIButton(frame: CGRect(x: self.frame.size.width-87, y: 8, width: 86, height: 50))
       button.setTitle("OK", for: [])
       button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), for: [])
       button.addTarget(self, action: Selector(("hideSnackBar:")), for: UIControl.Event.touchUpInside)
       self.addSubview(button)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
