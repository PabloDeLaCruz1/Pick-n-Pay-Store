//
//  WishListViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import UIKit
import SwiftUI

class WishListViewController: UIViewController,  UITableViewDataSource {


    @IBOutlet weak var table: UITableView!
    
    //making the heart gray color and unfavorite from wishlist
  
    
    struct WishList{
        var itemtitle: String
        var imageName: String
        var itemDiscount : Double
        var itemPrice : Double
    }
    let data: [WishList] = [
        WishList(itemtitle: "Ceramic blue and Brown plate", imageName: "garlic", itemDiscount: 3.4, itemPrice: 9.30),
        WishList(itemtitle: "Ceramic blue square place", imageName: "puma", itemDiscount: 1.99, itemPrice: 7.99)
        
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
        let WishListCell = table.dequeueReusableCell(withIdentifier: "WishListItem", for: indexPath) as! WishListTableViewCell
        WishListCell.itemTitleLabel.text = wishList.itemtitle
        WishListCell.itemImageView.image = UIImage(named: wishList.imageName)
//        WishListCell.itemDiscountLabel.text = "$" + String(wishList.itemDiscount)
        WishListCell.itemPriceLabel.text =  "$" +  String(wishList.itemPrice)
//        WishListCell.itemWishListHeartButton.tintColor = .init(red: 212, green: 62, blue: 103, alpha: 0.0 )
//        WishListCell.itemWishListHeartButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        return WishListCell
        
    }
 
    @IBAction func saveWishList(_ sender: Any) {
//        let data = CSData.  // .inst.getData()
//        for d in data{
//            print("id is ", d.id , "Score for ", d.typeService, " Total Room Score is: ", d.totalFood )
//        }
//        
    }
    
    
    
}
