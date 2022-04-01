//
//  Service.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/1/22.
//

import Foundation


let userData = MainDBHelper.init().getUsers()

struct Service {

    static func fetchData(_ completion: @escaping (Result<[User], Error>) -> ()) {
        completion(.success(userData))
    }


}

