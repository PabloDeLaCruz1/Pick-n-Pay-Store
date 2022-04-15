//
//  ContentDetailView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/14/22.
//

import SwiftUI

var userDetailsHost: UIHostingController<ContentDetailView>? = nil

struct ContentDetailView: View {
    @EnvironmentObject var baseData : HomeViewModel
    @Environment(\.currentUser) var currentUser
    

    var body: some View {
        UserDetailsView()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

