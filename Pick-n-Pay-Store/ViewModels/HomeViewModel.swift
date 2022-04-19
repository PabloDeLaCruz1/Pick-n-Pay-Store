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
    @Published var products: [Product] = [ // FOR TESTING PURPOSES, Products will come from API
        Product(name: "Item #1", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["Face", "Tag2", "tag3"], image: "product1", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Item #2", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["Care", "Tag2", "tag3"], image: "product2", color: UIColor(Color("pcolor2")), desc: "This is Item #2's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "Item #3", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["Health Care", "Tag2", "tag3"], image: "product3", color: UIColor(Color("pcolor1")), desc: "This is Item #3's description. It does this and that.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
        Product(name: "Item #4", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["Health Care", "expensive", "tag3"], image: "product4", color: UIColor(Color("pcolor4")), desc: "This is Item #4's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Item #5", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["Health Care", "expensive", "tag3"], image: "product5", color: UIColor(Color("pcolor3")), desc: "This is Item #5's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Item #6", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["Health Care", "expensive", "tag3"], image: "product6", color: UIColor(Color("pcolor2")), desc: "This is Item #6's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "Item #7", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["Health Care", "expensive", "tag3"], image: "product7", color: UIColor(Color("pcolor1")), desc: "This is Item #7's description. It does this and that.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
        Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["Health Care", "expensive", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #8's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        
        //Products to be on Offer scroll view
        Product(name: "E.Bundle", comments: ["Thank you for this awesome offer!", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider1", color: UIColor(Color("pcolor2")), desc: "This is E. Bundle's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "C.Bundle", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider2", color: UIColor(Color("pcolor1")), desc: "This is C. Bundle's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "Lambo", comments: ["Yes this Lambo really costs 13.37!", "(^.^)m ", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider3", color: UIColor(Color("pcolor4")), desc: "This is Lambo's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1)
        
        //------Items from CSData/CartSaveDataManager
        ,
        Product(name: "Bioré", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 23.97, tags: ["facewash", "tag2", "tag3"], image: "biore", color: UIColor(Color("pcolor4")), desc: "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Keychain", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 7.49, tags: ["personal", "tag2", "tag3"], image: "keychain", color: UIColor(Color("pcolor1")), desc: "Alphabet Initial Letter Keychain Resin Letter Keychain with Tassel Gradient Butterfly Pendant Bag Pendant", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Midori", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 11.49, tags: ["office", "tag2", "tag3"], image: "midori", color: UIColor(Color("pcolor2")), desc: "Midori MD Notebook - A5 Grid Paper", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Classic", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 12.00, tags: ["kitchen", "tag2", "tag3"], image: "classic", color: UIColor(Color("pcolor3")), desc: "Buffalo Wild Wings Classic Sauce - Medium, Comfortably Hot - 12 fl. oz. - PACK OF 2", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Garlic", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 13.81, tags: ["kitchen", "tag2", "tag3"], image: "garlic", color: UIColor(Color("pcolor4")), desc: "Bundle of 2 - Buffalo Wild Wings Parmesan Roasted Garlic Sauces, 12 fl oz each (2 pack)", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Powder", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 7.97, tags: ["Health Care", "tag2", "tag3"], image: "powder", color: UIColor(Color("pcolor1")), desc: "Gold Bond Medicated Talc-Free Foot Powder 10 oz, Maximum Strength Odor Control & Itch Relief", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Frixion", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 15.15, tags: ["office", "tag2", "tag3"], image: "frixion", color: UIColor(Color("pcolor2")), desc: "PILOT FriXion Clicker Erasable, Refillable & Retractable Gel Ink Pens, Fine Point, Assorted Color Inks, 10-Pack Pouch", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Puma", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 32.85, tags: ["apparel", "tag2", "tag3"], image: "puma", color: UIColor(Color("pcolor3")), desc: "PUMA Women Sports Bra, 3-Pack", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Stamps", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 10.24, tags: ["office", "tag2", "tag3"], image: "stamps", color: UIColor(Color("pcolor4")), desc: "Cling Stamp Set (Planner)", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
        Product(name: "Dymo", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 11.59, tags: ["office", "tag2", "tag3"], image: "dymo", color: UIColor(Color("pcolor1")), desc: "DYMO Embossing Label Maker with 3 DYMO Label Tapes", isLiked: false, rating: 4, isSaved: 0, quantity: 1)

    ]
    @Published var suggestedProducts: [Product] = [Product(name: "E.Bundle", comments: ["Thank you for this awesome offer!", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider1", color: UIColor(Color("pcolor2")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "C.Bundle", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider2", color: UIColor(Color("pcolor1")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
        Product(name: "Lambo", comments: ["Yes this Lambo really costs 13.37!", "(^.^)m ", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider3", color: UIColor(Color("pcolor4")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1)]
    //@Published var products: [Product] = productsForFiltering
}

//Need to not mutate the object holding the products being fitlered
var productsForFiltering = [// FOR TESTING PURPOSES, Products will come from API
    Product(name: "Item #1", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 19.99, tags: ["Health Care", "tag2", "tag3"], image: "product1", color: UIColor(Color("pcolor3")), desc: "This is Item #1's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Item #2", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 29.99, tags: ["Health Care", "tag2", "tag3"], image: "product2", color: UIColor(Color("pcolor2")), desc: "This is Item #2's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "Item #3", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 39.99, tags: ["Health Care", "tag2", "tag3"], image: "product3", color: UIColor(Color("pcolor1")), desc: "This is Item #3's description. It does this and that.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
    Product(name: "Item #4", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 49.99, tags: ["Health Care", "tag2", "tag3"], image: "product4", color: UIColor(Color("pcolor4")), desc: "This is Item #4's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Item #5", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 59.99, tags: ["Health Care", "tag2", "tag3"], image: "product5", color: UIColor(Color("pcolor3")), desc: "This is Item #5's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Item #6", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 69.99, tags: ["Health Care", "tag2", "tag3"], image: "product6", color: UIColor(Color("pcolor2")), desc: "This is Item #6's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "Item #7", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 79.99, tags: ["Health Care", "tag2", "tag3"], image: "product7", color: UIColor(Color("pcolor1")), desc: "This is Item #7's description. It does this and that.", isLiked: false, rating: 3, isSaved: 0, quantity: 1),
    Product(name: "Item #8", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 89.99, tags: ["Health Care", "tag2", "tag3"], image: "product8", color: UIColor(Color("pcolor4")), desc: "This is Item #8's description. It does this and that.", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    
    //Products to be on Offer scroll view
    Product(name: "E.Bundle", comments: ["Thank you for this awesome offer!", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider1", color: UIColor(Color("pcolor2")), desc: "This is E. Bundle's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "C.Bundle", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider2", color: UIColor(Color("pcolor1")), desc: "This is C. Bundle's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1),
    Product(name: "Lambo", comments: ["Yes this Lambo really costs 13.37!", "(^.^)m ", "Comment 3", "Comment 4"], offer: true, price: 13.37, tags: ["Offers", "tag2", "tag3"], image: "slider3", color: UIColor(Color("pcolor4")), desc: "This is Lambo's description. It does this and that.", isLiked: false, rating: 5, isSaved: 0, quantity: 1)


    //------Items from CSData/CartSaveDataManager
    ,
    Product(name: "Bioré", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 23.97, tags: ["facewash", "tag2", "tag3"], image: "biore", color: UIColor(Color("pcolor4")), desc: "Bioré Rose Quartz + Charcoal Daily Face Wash, Oil Free Facial Cleanser, 3-Pack Pouch", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Keychain", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 7.49, tags: ["personal", "tag2", "tag3"], image: "keychain", color: UIColor(Color("pcolor1")), desc: "Alphabet Initial Letter Keychain Resin Letter Keychain with Tassel Gradient Butterfly Pendant Bag Pendant", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Midori", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 11.49, tags: ["office", "tag2", "tag3"], image: "midori", color: UIColor(Color("pcolor2")), desc: "Midori MD Notebook - A5 Grid Paper", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Classic", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 12.00, tags: ["kitchen", "tag2", "tag3"], image: "classic", color: UIColor(Color("pcolor3")), desc: "Buffalo Wild Wings Classic Sauce - Medium, Comfortably Hot - 12 fl. oz. - PACK OF 2", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Garlic", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 13.81, tags: ["kitchen", "tag2", "tag3"], image: "garlic", color: UIColor(Color("pcolor4")), desc: "Bundle of 2 - Buffalo Wild Wings Parmesan Roasted Garlic Sauces, 12 fl oz each (2 pack)", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Powder", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 7.97, tags: ["Health Care", "tag2", "tag3"], image: "powder", color: UIColor(Color("pcolor1")), desc: "Gold Bond Medicated Talc-Free Foot Powder 10 oz, Maximum Strength Odor Control & Itch Relief", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Frixion", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 15.15, tags: ["office", "tag2", "tag3"], image: "frixion", color: UIColor(Color("pcolor2")), desc: "PILOT FriXion Clicker Erasable, Refillable & Retractable Gel Ink Pens, Fine Point, Assorted Color Inks, 10-Pack Pouch", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Puma", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 32.85, tags: ["apparel", "tag2", "tag3"], image: "puma", color: UIColor(Color("pcolor3")), desc: "PUMA Women Sports Bra, 3-Pack", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Stamps", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 10.24, tags: ["office", "tag2", "tag3"], image: "stamps", color: UIColor(Color("pcolor4")), desc: "Cling Stamp Set (Planner)", isLiked: false, rating: 4, isSaved: 0, quantity: 1),
    Product(name: "Dymo", comments: ["Comment 1", "Comment 2", "Comment 3", "Comment 4"], offer: false, price: 11.59, tags: ["office", "tag2", "tag3"], image: "dymo", color: UIColor(Color("pcolor1")), desc: "DYMO Embossing Label Maker with 3 DYMO Label Tapes", isLiked: false, rating: 4, isSaved: 0, quantity: 1)


]

