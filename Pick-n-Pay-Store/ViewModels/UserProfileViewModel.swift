//
//  UserProfileViewModel.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import Foundation
import SwiftUI


class UserProfileViewModel: ObservableObject {
    @Published var user: User? = nil

    init() {
        getData()
    }
    
    func getData(){
        guard let data = getJsonData() else { return }
        print("JSON DATA", data)
        
        let jsonData = String(data: data, encoding: .utf8)
        print(" DATA", jsonData)
        
        if let localData = try? JSONSerialization.jsonObject(with: data, options: []), let dictionary = localData as? [String:Any],
           let id = dictionary["id"] as? Int,
           let email = dictionary["email"] as? String,
           let cart = dictionary["cart"] as? String {
        
            let newUser = User(id: id, email: email, cart: cart)
            user = newUser
        }

    }

    func getJsonData() -> Data? {

        var dict: [String: Any] = ["id": 10, "email": "email2@gmail.com", "cart": "cart"]

        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
            return jsonData
        } catch {

        }
    }
}
