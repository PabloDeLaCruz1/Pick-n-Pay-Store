//
//  HomeViewModel.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

//We use a class so that our views (structs) can share the same value through the apps state
class HomeViewModel: ObservableObject {
    //Publish makes a variable an observable, telling all who listen when it updates.
    // MARK - USER
    @Environment(\.currentUser) var currentUser

    @Published var user = User()
    @Published var email = ""

    @Published var homeTab = "Facewash"
    @Published var category = "All"
    // MARK: - DETAIL VIEW
    @Published var currentProduct: Product?
    @Published var showDetail = false
    @Published var suggestedProducts: [Product] = [Product(name: "E.Bundle", comments: ["Thank you for this awesome offer!", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider1", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
        Product(name: "C.Bundle", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider2", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
        Product(name: "Lambo", comments: ["Yes this Lambo really costs 13.37!", "(^.^)m ", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider3", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5)]
    @Published var products: [Product] = productsForFiltering
}

//Need to not mutate the object holding the products being fitlered
let productsForFiltering = [// FOR TESTING PURPOSES, Products will come from API
    Product(name: "Item #1", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["Health Care", "tag2", "tag3"], image: "product1", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #2", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["Health Care", "tag2", "tag3"], image: "product2", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "Item #3", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["Health Care", "tag2", "tag3"], image: "product3", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
    Product(name: "Item #4", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["Health Care", "tag2", "tag3"], image: "product4", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #5", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["Health Care", "tag2", "tag3"], image: "product5", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
    Product(name: "Item #6", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["Health Care", "tag2", "tag3"], image: "product6", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "Item #7", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["Health Care", "tag2", "tag3"], image: "product7", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 3),
    Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["Health Care", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),

    //Products to be on Offer scroll view
    Product(name: "E.Bundle", comments: ["Thank you for this awesome offer!", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider1", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "C.Bundle", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider2", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5),
    Product(name: "Lambo", comments: ["Yes this Lambo really costs 13.37!", "(^.^)m ", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider3", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5)

    //------Items from CSData/CartSaveDataManager
    ,
    Product(name: "Bioré", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 23.97, tags: ["facewash", "tag2", "tag3"], image: "biore", color: UIColor(Color("pcolor4")), desc: "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch", isLiked: false, rating: 4)
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4)
//
//        ,
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4),
//        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["tag1", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4)


]

