//
//  WishListViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import UIKit
import SwiftUI

//create a new file with struct name there
class WishListViewController: UIViewController,  UITableViewDataSource {


    @IBOutlet weak var table: UITableView!
    
    //making the heart gray color and unfavorite from wishlist
    
    var dummyList = [DummyList]()
//
//    let item1 = DummyList(itemTitle: "Ceramic blue and Brown plate", imageName: "garlic", itemPrice: 9.30, itemId: 1)
    
    let data: [DummyList] = [
        DummyList(itemTitle: "Ceramic blue and Brown plate", imageName: "garlic", itemPrice: 9.30, itemId: 2, favorite: true),
        DummyList(itemTitle: "Ceramic blue square place", imageName: "puma", itemPrice: 7.99, itemId: 3, favorite: true)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }
    
    
    //displays total number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishList = data[indexPath.row]
        
        print(wishList)
        let WishListCell = table.dequeueReusableCell(withIdentifier: "WishListItem", for: indexPath) as! WishListTableViewCell
        WishListCell.itemTitleLabel.text = wishList.itemTitle
        WishListCell.itemImageView.image = UIImage(named: wishList.imageName)
        WishListCell.itemPriceLabel.text =  "$" +  String(wishList.itemPrice)

//        WishListCell.itemWishListHeartButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
        return WishListCell
        
    }
 
    //useful to save core data
    @IBAction func saveWishList(_ sender: Any) {
  
//        DBHelper.db.addWishListItem( itemName: <#String#>, itemImage: <#String#>, itemPrice: <#Double#> )
//        print("data saved")
    }
    
    
    
}
