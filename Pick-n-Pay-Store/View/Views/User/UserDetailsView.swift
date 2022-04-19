//
//  UserDetailsView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/14/22.
//

import SwiftUI

struct UserDetailsView: View {
    @EnvironmentObject var baseData: HomeViewModel
    @Environment(\.currentUser) var currentUser

    //FOR HERO EFFECT
//    var animation: Namespace.ID
    @State var size = "Order 2"
    @State var itemColor: Color = .red
  
    var body: some View {
        
        //MARK: SAFE CHECK
        if  true {
            VStack(spacing: 0) {
                //MARK: - APP BAR
                HStack {
                    //MARK: DRAWER MENU
//                    Button {
//                        withAnimation {
//                            baseData.showDetail = false
//                        }
//                    } label: {
//                        Image(systemName: "arrow.left")
//                            .font(.title2)
//                            .foregroundColor(.black)
//                    } // END DRAWER MENU

                    Spacer()

                    //MARK: SEARCH ICON
                    Button {

                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red, in: Circle())
                    } // END SEARCH ICON
                }
                    .foregroundColor(.black)
                    .overlay(
                    Image("pnpLogonbg")
                        .resizable()
                        .frame(width: 115, height: 115)
                        .clipShape(Circle().size(width: 115, height: 115))
                )                    .padding()
                // END APP BAR

                //MARK: - PRODUCT IMAGE
                Image("cat4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220, height: 220)
//                    .matchedGeometryEffect(id: user.image, in: animation)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                    ZStack {
                        Circle()
                            .fill(Color(UIColor(.blue)))
                            .padding()
                        Circle()
                            .fill(Color.white.opacity(0.5))
                            .padding(60)

                    }
                )
                    .frame(height: getScreenBound().height / 3)

                //MARK: - PRODUCT DETAILS
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text(currentUser.email!)
                            .font(.title.bold())


                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)

                        Text("(\(5))")
                            .foregroundColor(.gray)

                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elite.")
                        .font(.callout)
                        .lineSpacing(10)
                        .fixedSize(horizontal: false, vertical: true)


                    //MARK: PRODUCT SIZE
                    HStack(spacing: 0) {
                        Text("Orders ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)

                        ForEach(["Order1", "Order2", "Order3"], id: \.self) { size in
                            Button {
                                self.size = size

                            } label: {
                                Text(size)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal)
                                    .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.blue)
                                        .opacity(self.size == size ? 0.3 : 0)
                                )
                            }
                        }
                    } // END SIZE
                    .padding(.vertical)

                    //MARK: PRODUCT COLOR
                    HStack(spacing: 15) {
                        let colors: [Color] = [.red, .yellow, .purple, .green]
                        Text("Orders: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)

                        ForEach(colors, id: \.self) { color in
                            Button {
                                self.itemColor = .red

                            } label: {
                                Circle()
                                    .fill(color.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                    Circle()
                                        .stroke(Color("Btnbg"), lineWidth: 1.5)
                                        .opacity(itemColor == color ? 0.2 : 0)
                                        .padding(-4)
                                )
                            }
                        }
                    } // END Color
                    .padding(.vertical)

                    //MARK: - ADD TO CART
                    Button {

                    } label: {
                        HStack(spacing: 15) {
                            Image("person")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)

                            Text("Logout? Settings? ")
                                .fontWeight(.bold)
                        }
                            .foregroundColor(Color("Btnbg"))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Btnbg").opacity(0.06))
                            .clipShape(Capsule())
                    }
                        .padding(.top)

                }
                    .padding(.top)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(
                    Color("pcolor1")
                        .opacity(0.05)
                        .cornerRadius(20)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            }
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.white)
                .transition(.opacity)
        }
    }
    }


struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
