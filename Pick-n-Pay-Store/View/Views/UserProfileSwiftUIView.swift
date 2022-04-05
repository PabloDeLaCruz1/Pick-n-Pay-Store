//
//  UserProfileSwiftUIView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/4/22.
//

import SwiftUI


struct UserProfileSwiftUIView: View {

//    @State private var email: String = ""
//    @State private var cart: Cart = Cart()

    @StateObject private var vm = UserProfileViewModel()

    @Environment(\.managedObjectContext) var viewContext

//    @FetchRequest(entity: User.entity(), sortDescriptors: [], predicate: nil, animation: nil) var allUsers: FetchedResults<User>


    var body: some View {
//        let user = User(context: viewContext)
//        var user = User(id: 1, email: "no1", cart: Cart())

        VStack(alignment: .leading) {


            Text("Hello!")
//                Text("\(user.id)")

//                Text("email: \(user.email)")
//                Text("Cart! ", String(user.cart))

            Button("Save Data") {
                DBHelper.db.addData(email: "ello@gmail.com", guest: "Change to Bool Please", password: "123")
            }

            Spacer()

            Button("View Data") {
                let data = DBHelper.db.getUsers()

                for d in data {
                    print("hello")
                }
            }


        }.padding()
            .frame(maxWidth: 200, maxHeight: 200)
    }
}

struct UserProfileSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileSwiftUIView()
    }
}
