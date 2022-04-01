//
//  Service.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/1/22.
//

import Foundation


let userData = MainDBHelper.init().getUsers()

struct Service {

    //Static since structs cannot be subclassed and the compiler strongly prefers static evaluation
    //escaping to make the closure escape, since swift makes them nonescaping by default
    //because the closure passed as completion handler is executed once the request completes, which is some time after the data task is created. Meaning the closure will outlive the func scope.
    //Result is better for handling async work in swift.
    static func fetchData(_ completion: @escaping (Result<[User], Error>) -> ()) {
        completion(.success(userData))
    }
    


}

