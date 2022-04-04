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
        self.user = try? JSONDecoder().decode(User.self, from: data)
    }

    func getJsonData() -> Data? {

        var dict: [String: Any] = ["id": 10, "email": "email2@gmail.com", "cart": "cart"]
        
//        Service.fetchData { result in
//            <#code#>
//        }

        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
            return jsonData
        } catch {

        }
    }
}
