//
//  ItemCollectionViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/6/22.
//

// ----- this is now for wishlist content display since Pablo has a new display with SwiftUI  ---------
import UIKit


class ItemCollectionViewCell: UICollectionViewCell{

    var link: WishListTableViewCell?
    
    @IBOutlet var itemTitleLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemPriceSignLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    @IBAction func selectWishList(_ sender: Any) {
        print( "this item is added to the wishList ")
    }
    static let identifier = "ItemCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ItemCollectionViewCell", bundle: nil)
    }
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with storeItems: StoreItems){
        self.itemPriceLabel.text = String(storeItems.price)
        self.itemImageView.image = UIImage(named: storeItems.imageName)
        self.itemImageView.contentMode = .scaleAspectFill
        self.itemImageView.layer.cornerRadius = 8.0
        self.itemImageView.clipsToBounds = true
        self.itemTitleLabel.text = String(storeItems.title)
    }

}
