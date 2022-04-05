//
//  ContactHeartWishList.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/5/22.
//

import Foundation
import UIKit

class ContactHeart: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .red
        
        let heartButton = UIButton(type: .system)
        heartButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
