//
//  ItemsViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/6/22.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var storeItems = [StoreItems]()
    override func viewDidLoad() {
        super.viewDidLoad()


        table.register(ItemCollectionTableViewCell.nib(), forCellReuseIdentifier: ItemCollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
 

    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: ItemCollectionTableViewCell.identifier, for: indexPath) as! ItemCollectionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

}

struct StoreItems{
    let type : String
    let title : String
    let imageName : String
    let price : Double
    
    init(type: String, title:  String, imageName : String, price: Double)
    {
        self.type = type
        self.title = title
        self.imageName = imageName
        self.price = price
    }
    
}
