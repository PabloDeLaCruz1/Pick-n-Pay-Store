//
//  SignUpSwiftUIView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import SwiftUI


let lightGreyColor = Color(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0)

let storedEmail = "noemail@gmail.com"
let storedpassword = "wrongpass"

struct SignUpSwiftUIView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State var email: String = ""
    @State var password: String = ""

    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false

    var body: some View {

        ZStack {
            dismiss()

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
                    LoginButtonContent()
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
    }
}


struct SignUpSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSwiftUIView()

    }
}

struct HelloText: View {
    var body: some View {
        Text("Hello you!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("bigCartLogo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}
struct dismiss: View {
    var body: some View {
        Text("Back")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}


struct UsernameTextField: View {

    @Binding var email: String

    var body: some View {
        TextField("Email or Phone", text: $email)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {

    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
