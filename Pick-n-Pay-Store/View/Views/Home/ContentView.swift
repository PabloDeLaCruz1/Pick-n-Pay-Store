//
//  ContentView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

var myHostVc: UIHostingController<ContentView>? = nil
//var myHost2VC: UIHostingController<CommentsView>? = nil

struct ContentView: View {
    @EnvironmentObject var baseData : HomeViewModel
    @Environment(\.currentUser) var currentUser

    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        CommentsView()
    }
}
