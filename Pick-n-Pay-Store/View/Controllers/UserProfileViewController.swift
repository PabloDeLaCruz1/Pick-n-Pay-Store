//
//  UserProfileViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import UIKit
import SwiftUI

class UserProfileViewController: UIViewController{
    let db = MainDBHelper.init()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
//        UserProfileSwiftUIView().environment(\.managedObjectContext, viewContext)
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func btn(_ sender: Any) {
        let vc = UIHostingController(rootView: UserProfileSwiftUIView())

        present(vc, animated: true)
    }
    

}
