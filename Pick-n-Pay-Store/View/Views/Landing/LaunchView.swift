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
                .background(Color.green)
//            SplashScreen()
//                .opacity(showSplash ? 1 : 0)
//                .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                    SplashScreen.shouldAnimate = false
//                    withAnimation() {
//                        self.showSplash = false
//                    }
//                }
//            }
        }
            .onDisappear {
        }
    }
}

var guestUser = User()

private struct LoggedInKey: EnvironmentKey {
    static let defaultValue = false
}
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
        }
    }
#endif
