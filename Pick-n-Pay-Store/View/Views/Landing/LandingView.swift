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

    var center = CGPoint(x: 100, y: 100)

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
                VStack(alignment: .center) {
                    Spacer()
                    Image("appLogonbg")
                        .resizable()
                        .scaledToFit() .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color("pcolor1"), lineWidth: 5))
                    Spacer()
                    Spacer()
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
                            .accessibility(identifier: "loginScreen")

                    }
                    Spacer()
                }
                    .navigationBarTitle("Pick N' Pay")
                    .background(
                    Image(DBHelper.db.getImageData())
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.1)
                )
                    .navigationBarItems(trailing:
                        Button(
                        action: {
                            // Add action
                        },
                        label: {

                            NavigationLink(destination: StoryboardViewController() .background(
                                    Image(DBHelper.db.getImageData())
                                        .resizable()
                                        .ignoresSafeArea()
                                        .opacity(0.1)
                                )) {
                                Text("Continue as a Guest")
                            }
                        }
                    )
                )

//                .navigationBarTitleDisplayMode(.inline)
//                        .toolbar { // <2>
//                            ToolbarItem(placement: .principal) { // <3>
//                                VStack {
//                                    Text("Pick N' Pay").font(.largeTitle.bold()).padding()
//                                }
//                            }
//                        }

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
