//
//  HomeViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import UIKit
import SwiftUI


final class HomeViewController: UIHostingController<ContentView>, UIViewControllerRepresentable {

    typealias UIViewControllerType = HomeViewController
    @EnvironmentObject var baseData: HomeViewModel

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let myViewController = UIViewControllerType()
        // myView.delegate = context.coordinator
        return myViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // left blank
    }

    init() {
        let view = ContentView()
        super.init(rootView: view)
        myHostVc = self

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())
    }

}
