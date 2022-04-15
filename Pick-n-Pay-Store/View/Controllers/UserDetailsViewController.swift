//
//  UserDetailsViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/14/22.
//

import UIKit
import SwiftUI

final class UserDetailsViewController: UIHostingController<ContentDetailView>, UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UserDetailsViewController
    @Environment(\.currentUser) var currentUser
    
    var user = User()

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let myViewController = UIViewControllerType()
        // myView.delegate = context.coordinator
        
        self.user = currentUser
        myViewController.view.backgroundColor = UIColor(patternImage: UIImage(named: DBHelper.db.getImageData())!)

        return myViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // left blank
    }

    init() {
        let view = ContentDetailView()

        super.init(rootView: view)
        userDetailsHost = self
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentDetailView())
    }

}
