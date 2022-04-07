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

    
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
           let myViewController = UIViewControllerType()
           // myView.delegate = context.coordinator
           return myViewController
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
