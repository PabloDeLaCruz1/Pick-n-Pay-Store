//
//  LaunchView.swift
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

// MARK: Use for presentation/production
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

var guestUser = User()

//EnvironmentKeys for easy access throughout the app for user status
private struct LoggedInKey: EnvironmentKey {
    static let defaultValue = false
}

//MARK: We give all users a guest user account on App launch. In the future, we use this to save their information on UserDefaults if they do not register.
private struct CurrentUser: EnvironmentKey {
    static let defaultValue = DBHelper.db.setAndGetGuest()
}

extension EnvironmentValues {
    var loggedInKey: Bool {
        get { self[LoggedInKey.self] }
        set { self[LoggedInKey.self] = newValue }
    }
    var currentUser: User {
        get { self[CurrentUser.self] }
        set { self[CurrentUser.self] = newValue }
    }
}

#if DEBUG
    struct LaunchView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchView()
                .background(
                Image(DBHelper.db.getImageData())
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.5)
            )
        }
    }
#endif
