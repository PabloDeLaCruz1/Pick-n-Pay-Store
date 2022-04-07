//
//  LandingView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
                   VStack {
                       NavigationLink(destination: SignUpSwiftUIView()) {
                           Text("Link").padding()
                       }
                   } // Main VStack
                   .navigationBarTitle("Home")
                   .navigationBarHidden(true)

               } //NavigationView
        
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
