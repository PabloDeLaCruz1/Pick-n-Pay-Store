//
//  LoginSwiftUIView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/5/22.
//

import SwiftUI

struct LoginSwiftUIView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.currentUser) var currentUser

//    @State var email: String = ""
//    @State var password: String = ""
    @State var email: String = "yoyo"
    @State var password: String = "123"
    @State var tag: Int? = nil

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
                Spacer()
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
                    //TODO: get by email and pass
                    
                    let user = DBHelper.db.getOneUser(email: email.lowercased())

                    print("user email ------------", user)
                    if user != nil {
                        currentUser.password = user!.password
                        currentUser.cart = user!.cart
                        currentUser.email = user!.email
                        currentUser.creditCard = user!.creditCard
                        currentUser.guest = "false"
                        currentUser.history = user!.history
                        currentUser.orders = user!.orders
                        currentUser.phoneNumber = user!.phoneNumber
                        currentUser.wishlist = user!.wishlist
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                        self.tag = 1
                    } else {
                        print("User is not Valid!")
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                    }
                }) {
                    LoginButtonContent()
                }
                Spacer()
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
            .navigationBarTitle(Text(currentUser.guest == "True" ? "Log In!" : "Log Out"), displayMode: .inline)
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

struct StoryboardViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "tabbar")
        controller.view.backgroundColor = UIColor(patternImage: UIImage(named: DBHelper.db.getImageData())!)

        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}


struct LoginSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSwiftUIView()
    }
}
