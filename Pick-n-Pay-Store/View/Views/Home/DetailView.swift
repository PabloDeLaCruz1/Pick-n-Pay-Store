//
//  DetailView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: HomeViewModel
    @State var commentText : String = ""
    //FOR HERO EFFECT
    var animation: Namespace.ID

    @State var size = "2 Grams"
    @State var itemColor: Color = .red

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        //MARK: SAFE CHECK
        if var product = baseData.currentProduct, baseData.showDetail {
            VStack(spacing: 0) {
                //MARK: - APP BAR
                HStack {
                    //MARK: DRAWER MENU
                    Button {
                        withAnimation {
                            if commentText != "" {
                                //for viewing fast
                                product.comments?.append(commentText)
                                
                                DBHelper.db.addCommentToItem(commentText: commentText, product: product)
                            }
                            
                            baseData.showDetail = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    } // END DRAWER MENU

                    Spacer()

                    //MARK: SEARCH ICON
                    Button {

                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.gray, in: Circle())
                    } // END SEARCH ICON
                }
                    .foregroundColor(.black)
                    .overlay(
                    Image("logo3")
                        .resizable()
                        .frame(width: 140, height: 70)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .clipShape(Circle())
                )
                    .padding()
                // END APP BAR

                //MARK: - PRODUCT IMAGE
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220, height: 220)
                    .matchedGeometryEffect(id: product.image, in: animation)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                    ZStack {
                        Circle()
                            .fill(Color(product.color))
                            .padding()
                        Circle()
                            .fill(Color.white.opacity(0.5))
                            .padding(60)

                    }
                )
            
                    .frame(height: getScreenBound().height / 3)

                //MARK: - PRODUCT DETAILS
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(product.name!)
                            .font(.title.bold())

                        Spacer(minLength: 10)

                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)

                        Text("(\(product.rating))")
                            .foregroundColor(.gray)

                    }
                    Text(product.desc)
                        .font(.callout)
                        .lineSpacing(10)

                    //MARK: PRODUCT SIZE
                    HStack(spacing: 0) {
                        Text("Size: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)

                        ForEach(["1 Grams", "2 Grams", "3 Grams"], id: \.self) { size in
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
                    //MARK: PRODUCT SIZE
                    HStack(spacing: 0) {

                        Image(systemName: "magnifyingglass")
                        TextField("Comment ..", text: $commentText)

                    } // END SIZE
                    .padding(.vertical)

                    //MARK: PRODUCT COLOR
                    HStack(spacing: 15) {
                        let colors: [Color] = [.red, .yellow, .purple, .green]
                        Text("Colors: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)

                        ForEach(colors, id: \.self) { color in
                            Button {
                                self.itemColor = color

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
                        if commentText != "" {
                            //for viewing fast
                            product.comments?.append(commentText)
                        }
                        DBHelper.db.updateUserCart(email: baseData.currentUser.email!, product: product)
                        
                    

                    } label: {
                        HStack(spacing: 15) {
                            Image("cart")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)

                            Text("Add to cart")
                                .fontWeight(.bold)
                        }
                            .foregroundColor(Color("Btnbg"))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Btnbg").opacity(0.06))
                            .clipShape(Capsule())
                    }
                        .padding(.top)
                    CommentsView()
                }
                    .padding(.top)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(
                    Color("Btnbg")
                        .opacity(0.05)
                        .cornerRadius(20)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            }
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.white)
                .transition(.opacity)
            
        } // end of navigation view
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//MARK: - VIEW EXTENSION
extension View {
    func getScreenBound() -> CGRect {
        return UIScreen.main.bounds
    }
}
