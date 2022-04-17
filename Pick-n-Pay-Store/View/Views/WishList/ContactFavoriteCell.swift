//
//  ContactFavoriteCell.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/16/22.
//

import Foundation
import UIKit

class ContactFavoriteCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
