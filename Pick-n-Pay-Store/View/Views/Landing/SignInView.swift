//
//  SignInSwiftUIView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import SwiftUI

struct SignInSwiftUIView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var email: String = ""
    @State var password: String = ""

    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var btnBack: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
            HStack {
                Image("ic_back") // set image here
                .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                Text("Go back")
            }
        }
    }

    var body: some View {
        ZStack {
            VStack {
                HelloText()
                UserImage()
                UsernameTextField(email: $email)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }

                Button(action: {
                    if self.email == storedEmail && self.password == storedpassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    } else {
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                    }
                }) {
                    NavigationLink(destination: LandingViewController()) {
                        LoginButtonContent()
                    }
                }
            }
                .padding()


            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.yellow)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
            }
        }
            .navigationBarTitle(Text("Sign In!"), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            })
    }

}


struct SignInSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSwiftUIView()

    }
}
