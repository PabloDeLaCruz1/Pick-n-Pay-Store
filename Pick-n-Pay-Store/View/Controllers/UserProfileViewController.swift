//
//  UserProfileViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import UIKit
import SwiftUI

class UserProfileViewController: UIViewController{
//    let db = MainDBHelper.init()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
//        UserProfileSwiftUIView().environment(\.managedObjectContext, viewContext)
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func btn(_ sender: Any) {
//        let vc = UIHostingController(rootView: UserProfileSwiftUIView())
//
//        present(vc, animated: true)
//        let testdb = DBHelper()
        DBHelper.db.addData(email: "1essllo@gmail.com", guest: "trlse", password: "1234")
        
    }
    

    @IBAction func btn2(_ sender: Any) {
        let data = DBHelper.db.getUsers()
//
        for d in data {
            print("User info: ", d.id, d.email, d.guest, d.password, d.cart?.total)
            
        }
        
        let oneuser = DBHelper.db.getOneUser(email: "1essllo@gmail.com")
        print("one user, ", oneuser)
    }
    
    @IBAction func btn3(_ sender: Any) {
        DBHelper.db.updateUser(email: "1essllo@gmail.com", creditCard: "1111-1111-1111-1111")
    }
    
    @IBAction func btn4(_ sender: Any) {
        DBHelper.db.deleteUser(email: "1essllo@gmail.com")
    }
}
