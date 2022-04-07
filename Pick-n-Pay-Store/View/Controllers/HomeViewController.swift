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
    
    
    @EnvironmentObject var baseData : HomeViewModel
    
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//struct HomeViewControllerWrapper: UIViewControllerRepresentable {
//
//    typealias UIViewControllerType = HomeViewController
//
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<HomeViewControllerWrapper>) -> HomeViewControllerWrapper.UIViewControllerType {
//        return HomeViewController(coder: NSCoder())
//    }
//
//    func updateUIViewController(_ uiViewController: HomeViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeViewControllerWrapper>) {
//        //
//    }
//}
