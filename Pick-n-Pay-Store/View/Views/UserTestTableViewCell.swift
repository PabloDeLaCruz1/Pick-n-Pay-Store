//
//  UserTestTableViewCell.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/1/22.
//

import UIKit

class UserTestTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    @IBOutlet weak var guestStatusLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    
    //didSet is a 'property observer' that helps us keep our code syncronized. It executes code when a property has just been set
    var userTestViewModel: UserTestViewModel! {
        didSet {
            userEmailLabel?.text = userTestViewModel.email
            guestStatusLabel?.text = userTestViewModel.guest
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
