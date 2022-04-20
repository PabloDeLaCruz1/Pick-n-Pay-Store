//
//  ItemsViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/6/22.
//

// ----- this is now for wishlist content display since Pablo has a new display with SwiftUI  ---------
import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var storeItems = [StoreItems]()
    override func viewDidLoad() {
        super.viewDidLoad()


        storeItems.append(StoreItems(type: "Dishes", title: "Blue and brown plate", imageName: "plates", priceSign: "$", price: 5.99))
        storeItems.append(StoreItems(type: "Dishes", title: "Blue Plate", imageName: "plates1",priceSign: "$", price: 6.99))
        storeItems.append(StoreItems(type: "Dishes", title: "brown plate", imageName: "plates2",priceSign: "$", price: 4.99))
        storeItems.append(StoreItems(type: "Dishes", title: "Blue  brown plate", imageName: "plates4",priceSign: "$",  price: 7.59))
        storeItems.append(StoreItems(type: "Dishes", title: "Another plate", imageName: "plates3",priceSign: "$", price: 3.59))

        
        table.register(ItemCollectionTableViewCell.nib(), forCellReuseIdentifier: ItemCollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
 

    //table total items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeItems.count
    }
    //table show each cell item in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: ItemCollectionTableViewCell.identifier, for: indexPath) as! ItemCollectionTableViewCell
        cell.configure(with: storeItems)
        return cell
    }
    //displays each cell with 250 height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

}

struct StoreItems{
    let type : String
    let title : String
    let imageName : String
    let priceSign : String
    let price : Double
    
    init(type: String, title:  String, imageName : String, priceSign: String, price: Double)
    {
        self.type = type
        self.title = title
        self.imageName = imageName
        self.priceSign = priceSign
        self.price = price
    }
    
}
