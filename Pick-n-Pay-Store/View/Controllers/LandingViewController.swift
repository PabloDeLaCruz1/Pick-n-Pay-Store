//
//  LandingViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import UIKit
import SwiftUI

final class LandingViewController: UIViewController, UIViewControllerRepresentable {
    typealias UIViewControllerType = LandingViewController
//    var scoreLabel: UILabel!

    
    var label:UILabel!
   var button:UIButton!
    func makeUIViewController(context: Context) -> UIViewControllerType {
           let myViewController = UIViewControllerType()
        
           // myView.delegate = context.coordinator
        myViewController.view.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        let btnLogin:UIButton = {
            let btn = UIButton(type:.system)
            btn.backgroundColor = .blue
            btn.setTitle("Login", for: .normal)
            btn.tintColor = .white
            btn.layer.cornerRadius = 5
            btn.clipsToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        btnLogin.addTarget(self,action:#selector(buttonClicked),
                           for:.touchUpInside)
        
        myViewController.view.addSubview(btnLogin)
        
           return myViewController
       }
    @objc func buttonClicked(sender:UIButton)
    {
//        self.performSegue(withIdentifier: "TabBarSegue", sender: self)
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "landing") as! LandingViewController
        self.present(viewController, animated: false, completion: nil)
    }


       func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
               // left blank
//           view = UIView()
//           view.backgroundColor = .white
//           scoreLabel = UILabel()
//           scoreLabel.translatesAutoresizingMaskIntoConstraints = false
//           scoreLabel.textAlignment = .right
//           scoreLabel.text = "-------------------: 0"
//           view.addSubview(scoreLabel)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUp(_ sender: Any) {
        let vc = UIHostingController(rootView: ContentView())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)

    }

    @IBAction func login(_ sender: Any) {
        let vc = UIHostingController(rootView: SignUpSwiftUIView())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
    }
}
