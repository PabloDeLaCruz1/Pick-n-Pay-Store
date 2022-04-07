//
//  LandingViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import UIKit
import SwiftUI

class LandingViewController: UIViewController {

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
