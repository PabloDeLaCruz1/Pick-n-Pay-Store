//
//  SignUpSwiftUIView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//
import SwiftUI
import MapKit

struct LaunchView: View {
    @State var showSplash = true

    var body: some View {

        ZStack {
            LandingView()
                .background(Color.green)
            SplashScreen()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    SplashScreen.shouldAnimate = false
                    withAnimation() {
                        self.showSplash = false
                    }
                }
            }
        }
            .onDisappear {
        }
    }
}

#if DEBUG
    struct LaunchView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchView()
        }
    }
#endif
