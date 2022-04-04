//
//  SignUpViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import UIKit
import SwiftUI // for published

class SignUpViewController: UIViewController {

    //Using this page as an example, we dont need this here for now,
    //But we can use in the future to see if a user is sign in, we redirect
    @StateObject var viewModel = SignUpViewModel()
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //TODO: Add View
        mainLabel.text = "Hello \(String(describing: viewModel.user?.guest))"
    }

    @IBAction func signUpPressed(_ sender: Any) {
            
        
    }
    
}
