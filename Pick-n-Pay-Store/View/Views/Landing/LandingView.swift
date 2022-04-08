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
        
        if loggedInKey {
            StoryboardViewController()
        } else {
    
        NavigationView {

            VStack {
                Image("appLogo")
                    .resizable()
                    .scaledToFit() .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color("pcolor1"), lineWidth: 5))

                Button(action: {
                }) {
                    NavigationLink(destination: SignUpSwiftUIView()) {
                        SignUpButtonContent()
                    }
                }

                Button(action: {
                }) {
                    NavigationLink(destination: LoginSwiftUIView()) {
                        LoginButtonContent()
                    }
                }
            }
                .navigationBarTitle("Shopper")
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
