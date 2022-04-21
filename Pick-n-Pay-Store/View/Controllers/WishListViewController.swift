//
//  WishListViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import UIKit
import SwiftUI

//create a new file with struct name there
class WishListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @Environment(\.currentUser) var currentUser

    @IBOutlet weak var table: UITableView!

    var data = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        for item in currentUser.wishlist!.items! {
            data.append(item)
        }
    }

    //displays total number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let WishListCell = table.dequeueReusableCell(withIdentifier: "WishListItem", for: indexPath) as! WishListTableViewCell
        WishListCell.itemTitleLabel.text = data[indexPath.row].name
        let image = UIImage(named: data[indexPath.row].image)
        WishListCell.itemImageView.image = image
        WishListCell.itemPriceLabel.text = "$" + String (data[indexPath.row].price)

        return WishListCell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        @Namespace var animation
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0 :
                var detailItem = DetailView(animation: animation)
                var uiHosting = UIHostingController(rootView: detailItem)
                addChild(uiHosting)
                uiHosting.view.frame = view.bounds
                view.addSubview(uiHosting.view)
                uiHosting.didMove(toParent: self)
               // DetailView(animation: animation)
                print("inside indexPath.item")
//        for item in currentUser.wishlist!.items!{
//            didTapItem()
//            print("inside the for loop")
//
//        switch item {
//        case item:
//        print(" in case item")
//        default:
//            print("in default")
//        }
            default:
                print("in default")
            }
        default:
            print("outside of section switch case")
        }
    
    
    func didTapItem(){
        @Namespace var animation
        //SwiftUI intersep
        //let itemsViewController = UIviewcontrollerty
        let vc = UIHostingController(rootView: DetailView(animation: animation))
        present(vc, animated: true)
        }
    }


}
