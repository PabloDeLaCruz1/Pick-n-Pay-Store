//
//  LandingViewModel.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var user: User? = User(id: 111, email: "dood@gmail.com", guest: true)
    
}
