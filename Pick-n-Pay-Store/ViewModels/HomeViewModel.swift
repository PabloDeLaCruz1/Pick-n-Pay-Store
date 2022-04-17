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
    @Published var user = User()
    @Published var email = ""

    @Published var homeTab = "Facewash"

    // MARK: - DETAIL VIEW
    @Published var currentProduct: Product?
    @Published var showDetail = false
//    init  () {
//
//    }
}

