//
//  LandingView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

struct LandingView: View {

//    @EnvironmentObject private var loggedIn = false
    @Environment(\.loggedInKey) var loggedInKey
    var body: some View {

        if false {
            StoryboardViewController()
                .background(
                        Image(DBHelper.db.getImageData())
                            .resizable()
                            .ignoresSafeArea()
                            .opacity(0.1)
                    )
        } else {

            NavigationView {
                VStack {
                    Spacer()

                    Image("appLogo")
                        .resizable()
                        .scaledToFit() .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color("pcolor1"), lineWidth: 5))

                    Button(action: {
                    }) {
                        NavigationLink(destination: SignUpView() .background(
                                Image(DBHelper.db.getImageData())
                                    .resizable()
                                    .ignoresSafeArea()
                                    .opacity(0.1)
                            )) {
                            SignUpButtonContent()
                        }
                    }

                    Button(action: {
                    }) {
                        NavigationLink(destination: LoginSwiftUIView() .background(
                            Image(DBHelper.db.getImageData())
                                    .resizable()
                                    .ignoresSafeArea()
                                    .opacity(0.1)
                            )) {
                            LoginButtonContent()
                        }
                    }
                    Spacer()
                }
                    .navigationBarTitle("Shopper")
                    .background(
                        Image(DBHelper.db.getImageData())
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.1)
                )
                    .navigationBarItems(trailing:
                        Button(action: {
                        // Add action
                    }, label: {
                            Text("Continue as a Guest")
                        })
                )

//                   .navigationBarHidden(true)
            } //NavigationView

        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

struct LoginButtonContent: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("cart")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)

            Text("Login")
                .fontWeight(.bold)
        }
            .foregroundColor(Color("Btnbg"))
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color("Btnbg").opacity(0.06))
            .clipShape(Capsule())

    }
}
