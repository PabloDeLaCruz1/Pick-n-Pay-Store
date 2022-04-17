//
//  WishListDummyData.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/16/22.
//

import Foundation

struct DummyList{
    let itemTitle, imageName : String
//        var itemTitle: String
//        var imageName: String
    var itemPrice : Double
    var itemId : Int
    var favorite : Bool
    
    init(itemTitle: String, imageName : String, itemPrice: Double, itemId : Int, favorite: Bool){
        self.imageName = imageName
        self.itemPrice = itemPrice
        self.itemTitle = itemTitle
        self.itemId = itemId
        self.favorite = favorite
    }
    func getTitle(){
        print(imageName)
    }
  
}
