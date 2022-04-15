//
//  Product.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

//Item Placeholder
struct Product: Identifiable, EnvironmentKey {
    static var defaultValue = products
    
    typealias Value = [Product]
    
    var id = UUID().uuidString
    var name: String?
    var comments: [String]?
    var offer: Bool
    var price: Double
    var tags: [String]?
    var image: String
    var color: UIColor
    var desc: String
    var isLiked: Bool
    var rating: Int
}

//var products = [
//Product(productImage: "product1", productTitle: "Attenir Oil", productPrice: "$25.99", productColor: Color("pcolor3"), productDescription: "Attenir Skin Clear Cleanse Oil cleanses makeup, skin stains and impurities on the skin while leaving it supple and firm.", productRating: 4),
//Product(productImage: "product2", productTitle: "Attenir Lift", productPrice: "$36.0", productColor: Color("pcolor2"), productDescription: "Dress Lift Day Emulsion is Attenir's anti-ageing regenerating lifting emulsion for daily facial care.", productRating: 5),
//Product(productImage: "product3", productTitle: "Recast Care", productPrice: "$52.0", productColor: Color("pcolor1"), productDescription: "Recast vitamin c facial serum is a extremely light weight serum infused with the stable form of vitamin c.", productRating: 3),
//Product(productImage: "product4", productTitle: "Hawaiian Tropic", productPrice: "60.0", productColor: Color("pcolor4"), productDescription: "Let the luxurious feel and exotic scents of Hawaiian Tropic Sheer Touch take you to the tropics.", productRating: 4),
//]

//make viewModel
var products = [
    Product(name: "Item #1", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["tag1", "tag2", "tag3"], image: "product1", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #2", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["tag1", "tag2", "tag3"], image: "product2", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "Item #3", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["tag1", "tag2", "tag3"], image: "product3", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
    Product(name: "Item #4", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["tag11", "tag2", "tag3"], image: "product4", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #5", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["tag11", "tag2", "tag3"], image: "product5", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #6", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["tag11", "tag2", "tag3"], image: "product6", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "Item #7", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["tag11", "tag2", "tag3"], image: "product7", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
    Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4)
]

func ForzaAPI() -> String {
    var imgUrl: String = ""

    //URL
    let url = URL(string: "https://forza-api.tk/")
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
