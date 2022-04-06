//
//  ItemCollectionTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/6/22.
//

import UIKit

class ItemCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.count
    }
cxz     
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
            cell.configure(with: storeItems[indexPath.row])
        return cell
        
    }
    
    
    static let identifier = "ItemCollectionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ItemCollectionTableViewCell", bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    var storeItems = [StoreItems]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ItemCollectionTableViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionTableViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
