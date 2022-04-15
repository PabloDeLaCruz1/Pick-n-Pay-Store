//
//  Product.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

//Item Placeholder
struct Product: Identifiable {
    var id = UUID().uuidString
    var productImage: String
    var productTitle: String
    var productPrice: String
    var productColor: Color
    var productDescription: String
    var isLiked: Bool = false
    var productRating: Int
}

var products = [
Product(productImage: "product1", productTitle: "Attenir Oil", productPrice: "$25.99", productColor: Color("pcolor3"), productDescription: "Attenir Skin Clear Cleanse Oil cleanses makeup, skin stains and impurities on the skin while leaving it supple and firm.", productRating: 4),
Product(productImage: "product2", productTitle: "Attenir Lift", productPrice: "$36.0", productColor: Color("pcolor2"), productDescription: "Dress Lift Day Emulsion is Attenir's anti-ageing regenerating lifting emulsion for daily facial care.", productRating: 5),
Product(productImage: "product3", productTitle: "Recast Care", productPrice: "$52.0", productColor: Color("pcolor1"), productDescription: "Recast vitamin c facial serum is a extremely light weight serum infused with the stable form of vitamin c.", productRating: 3),
Product(productImage: "product4", productTitle: "Hawaiian Tropic", productPrice: "60.0", productColor: Color("pcolor4"), productDescription: "Let the luxurious feel and exotic scents of Hawaiian Tropic Sheer Touch take you to the tropics.", productRating: 4),
]

//make viewModel
var products = [
    Item(name: "Item #1", comments: ["Comment1", "Comment2", "Comment3"], offer: false, price: 22.25, tags: ["tag1", "tag2", "tag3"]),
    Item(name: "Item #2", comments: ["Comment1", "Comment2", "Comment3"], offer: false, price: 172.25, tags: ["tag1", "tag2", "tag3"]),
    Item(name: "Item #3", comments: ["Comment1", "Comment2", "Comment3"], offer: false, price: 2.25, tags: ["tag1", "tag2", "tag3"]),
    Item(name: "Item #4", comments: ["Comment1", "Comment2", "Comment3"], offer: false, price: 100, tags: ["tag1", "tag2", "tag3"]),
]

func ForzaAPI() -> String {
    var imgUrl : String = ""
    
    //URL
    let url = URL(string:"https://forza-api.tk/")
    guard url != nil else {
       return "Error creating url object"
    }
    
    // URL Request
    var request = URLRequest(url: url!)
    
    //Specify the header
//    let headers = []
    
    //Specify the body
    
    //Set the erequest type
    
    //Get the URLSession
    
    //Create Data task
    
    //Fire off data task
    

    return imgUrl
}
