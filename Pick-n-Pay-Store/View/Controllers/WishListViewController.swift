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

    //useful to save core data
    @IBAction func saveWishList(_ sender: Any) {

//        DBHelper.db.addWishListItem( itemName: <#String#>, itemImage: <#String#>, itemPrice: <#Double#> )
//        print("data saved")
    }



}
