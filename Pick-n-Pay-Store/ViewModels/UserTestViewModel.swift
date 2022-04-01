//
//  LandingViewModel.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/1/22.
//

import Foundation


struct UserTestViewModel {
    let email: String
    let guest: String

    //Using dependency injection to add our User Model
    init (_ user: User) {
        email = user.email
        guest = String(user.guest)
    }

}
