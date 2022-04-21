//
//  SignUpView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import SwiftUI


let lightGreyColor = Color(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0)

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Environment(\.currentUser) var currentUser
    @State var tag: Int? = nil

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
            NavigationLink(
                destination: StoryboardViewController()
                    .background(
                    Image(DBHelper.db.getImageData())
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.1)
                ),
                tag: 1,
                selection: $tag) {

            }
            VStack {
                Spacer()
//                HelloText()
                UserImage()
                UsernameTextField(email: $email)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }

                Button(action: {
                    self.tag = 1
                    
                    currentUser.email = email.lowercased()
//                    currentUser.password = password
                    
                    DBHelper.db.updateUser(user: currentUser)
                    print("User added to DB")
                }) {
                    SignUpButtonContent()

                }
                Spacer()
            }
                .padding()


            if authenticationDidSucceed {
                Text("You Signed Up!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.yellow)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
            }
        }
            .navigationBarTitle(Text("Log Out"), displayMode: .inline)
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


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()

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
        Image("appLogonbg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 400)
//            .clipped()
//            .cornerRadius(150)
            .padding(.bottom, 75)
            .shadow(radius: 5)

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
            .shadow(radius: 2)
            .autocapitalization(.none)
            .disableAutocorrection(true)
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
            .shadow(radius: 2)

    }
}
struct SignUpButtonContent: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("person")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)

            Text("Sign Up!")
                .fontWeight(.bold)
        }
            .foregroundColor(Color("Btnbg"))
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color("Btnbg").opacity(0.06))
            .clipShape(Capsule())

    }
}



