//
//  ItemCollectionTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/6/22.
//

import UIKit

class ItemCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "ItemCollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ItemCollectionTableViewCell", bundle: nil)
    }
    
    func configure(with storeIrems: [StoreItems]){
        self.storeItems = storeIrems
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    //store items
    var storeItems = [StoreItems]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        cell.configure(with: storeItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    
}
