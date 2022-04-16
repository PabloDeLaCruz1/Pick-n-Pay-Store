//
//  UserProfileViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import UIKit
import SwiftUI

class UserProfileViewController: UIViewController{

    @Environment(\.currentUser) var currentUser
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = currentUser.email
    }
    
    @IBAction func btn(_ sender: Any) {
//        let vc = UIHostingController(rootView: UserProfileSwiftUIView())
//
//        present(vc, animated: true)
//        let testdb = DBHelper()
        DBHelper.db.addData(email: "2essllo@gmail.com", guest: "True", password: "1234")
        
    }
    

    @IBAction func btn2(_ sender: Any) {
        let data = DBHelper.db.getUsers()
//
        for d in data {
            print("User info: ", d.id, d.email ?? "", d.guest ?? "true", d.password ?? "123", d.cart?.total ?? "", d.orders)
            
        }
    }
    
    @IBAction func btn3(_ sender: Any) {
//        DBHelper.db.updateUser(email: "2essllo@gmail.com", creditCard: "1111-1111-1111-1111")
//        let oneuser = DBHelper.db.getOneUser(email: "2essllo@gmail.com")
//        print("User updated, ------", oneuser.cart?.total, oneuser.creditCard)
        
//        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        //update wishlist with item
//        let item = Item(context: DBHelper.db.context!)
//        DBHelper.db.updateUserWishList(email: "2essllo@gmail.com", item: item)
        
        //add order
        let order = Order(context: DBHelper.db.context!)
        DBHelper.db.addOrder(email: "2essllo@gmail.com", order: order)
    }
    
    @IBAction func btn4(_ sender: Any) {
        DBHelper.db.deleteUser(email: "2essllo@gmail.com")
    }
    @IBAction func addCartTotal(_ sender: Any) {
//        DBHelper.db.addCartTotal(total: 100)
    }
}
