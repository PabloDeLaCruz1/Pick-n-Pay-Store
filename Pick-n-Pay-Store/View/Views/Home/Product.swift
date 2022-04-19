//
//  Product.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

//Item Placeholder
class Product: ObservableObject, Identifiable {

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
    var isSaved: Int16
    var quantity: Int16

    init(name: String, comments: [String], offer: Bool, price: Double, tags: [String], image: String, color: UIColor, desc: String, isLiked: Bool, rating: Int, isSaved: Int16, quantity: Int16) {
        self.name = name
        self.comments = comments
        self.offer = offer
        self.price = price
        self.tags = tags
        self.image = image
        self.color = color
        self.desc = desc
        self.isLiked = isLiked
        self.rating = rating
        self.isSaved = isSaved
        self.quantity = quantity
    }

}

//struct Product: Identifiable {
//
//    var id = UUID().uuidString
//    var name: String?
//    var comments: [String]?
//    var offer: Bool
//    var price: Double
//    var tags: [String]?
//    var image: String
//    var color: UIColor
//    var desc: String
//    var isLiked: Bool
//    var rating: Int
//    var isSaved: Int16
//    var quantity: Int16
//    var idd = 0
//
////
////    init(isLiked: Bool = false) {
////        self.color = color
////    }
//
//   
//}
//
//extension Product {
//    mutating func change() {
//        isLiked.toggle()
//    }
//}




class isLiked{
    var isLiked : Bool
    init(){
        isLiked = false
    }
    func isLikedChecked() -> Bool{
        if (isLiked == false){
            isLiked = true
        }
        else {
            isLiked = false
        }
        return isLiked
    }
}

//var liked = isLiked()





//var products = [
//Product(productImage: "product1", productTitle: "Attenir Oil", productPrice: "$25.99", productColor: Color("pcolor3"), productDescription: "Attenir Skin Clear Cleanse Oil cleanses makeup, skin stains and impurities on the skin while leaving it supple and firm.", productRating: 4),
//Product(productImage: "product2", productTitle: "Attenir Lift", productPrice: "$36.0", productColor: Color("pcolor2"), productDescription: "Dress Lift Day Emulsion is Attenir's anti-ageing regenerating lifting emulsion for daily facial care.", productRating: 5),
//Product(productImage: "product3", productTitle: "Recast Care", productPrice: "$52.0", productColor: Color("pcolor1"), productDescription: "Recast vitamin c facial serum is a extremely light weight serum infused with the stable form of vitamin c.", productRating: 3),
//Product(productImage: "product4", productTitle: "Hawaiian Tropic", productPrice: "60.0", productColor: Color("pcolor4"), productDescription: "Let the luxurious feel and exotic scents of Hawaiian Tropic Sheer Touch take you to the tropics.", productRating: 4),
//]

//make viewModel
var products = [
    Product(name: "Men Pullover Sweater", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["shirt", "clothing", "winter"], image: "pullover", color: UIColor(Color("pcolor3")), desc: "Brown pullover sweater, has a round neck, long sleeves, straight hem..", isLiked: true, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Black Fit Top", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["shirt", "clothing", "fitness"], image: "blacktop", color: UIColor(Color("pcolor2")), desc: "Black fitness top perfect for working out.", isLiked: true, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "Longline Over Coat", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["coat", "cloathing", "winter"], image: "overcoat", color: UIColor(Color("pcolor1")), desc: "Black longline over coat, has a notched lapel collar, button closure, long sleeves.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
    Product(name: "Graphic Baseball Collar Shirt", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["shirt", "clothing", "summer"], image: "jersey", color: UIColor(Color("pcolor4")), desc: "Men 1pc Letter Graphic Baseball Collar Shirt", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "The Chrono S", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["watch", "accessory", "mens"], image: "watch1", color: UIColor(Color("pcolor3")), desc: "The Chrono S is built to last and designed to be the most versatile watch you’ll ever own.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Timex Unisex Fairfield 41mm", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["watch", "accessory", "mens", "womans"], image: "watch2", color: UIColor(Color("pcolor2")), desc: "The Fairfield collection carries the refreshing, minimalist design that the Timex brand was built on with a remarkably clean dial and interchangeable slip-thru and quick-release strap options.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "SLITHERING SILVER", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["bracelet", "accessory", "mens"], image: "bracelet1", color: UIColor(Color("pcolor1")), desc: "Solid 925 Sterling Silver Bracelet for Men - Sizes 7 to 10.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
    Product(name: "Cuban Link Bracelet", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["bracelet", "accessory", "mens"], image: "bracelet2", color: UIColor(Color("pcolor4")), desc: "Finally, a classic, lightweight bracelet without sacrificing bold links and luxurious shine.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Drake Cuffed Pants", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 27.99, tags: ["pants", "clothing", "mens"], image: "joggers", color: UIColor(Color("pcolor4")), desc: "The best selling Drake Cuffed Pant is our all time favorite jogger.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Loose Fit Track", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 14.99, tags: ["pants", "clothing", "mens"], image: "joggers2", color: UIColor(Color("pcolor4")), desc: "Our Loose Fit Track made from 100% Cotton 280 GSM brushed back fleece offers all day comfort.", isLiked: false, rating: 4, isSaved: 0, quantity: 1)
]
//var products = [
//    Product(name: "Item #1", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["tag1", "tag2", "tag3"], image: "product1", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//    Product(name: "Item #2", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["tag1", "tag2", "tag3"], image: "product2", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
//    Product(name: "Item #3", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["tag1", "tag2", "tag3"], image: "product3", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
//    Product(name: "Item #4", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["tag11", "tag2", "tag3"], image: "product4", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//    Product(name: "Item #5", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["tag11", "tag2", "tag3"], image: "product5", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//    Product(name: "Item #6", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["tag11", "tag2", "tag3"], image: "product6", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
//    Product(name: "Item #7", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["tag11", "tag2", "tag3"], image: "product7", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
//    Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4)
//]

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


