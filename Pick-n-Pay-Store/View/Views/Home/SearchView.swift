//
//  SearchView.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/18/22.
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data

import SwiftUI

struct SearchView: View {
    //MARK: - GEOMETRY EFFECT
    @Namespace var animation
//    @EnvironmentObject var baseData: HomeViewModel
    @StateObject var baseData: HomeViewModel = HomeViewModel()
    @Environment(\.currentUser) var currentUser

    @State private var searchText = ""

    @State private var showPopUp = false
    @State private var filtered = [Product]()

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 15) {
                    //MARK - APP BAR
                    HStack(spacing: 100) {
                        //MARK: DRAWER MENU
                        Button {

                        } label: {
                            Image("menu")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        } // END DRAWER MENU

                        Spacer()

                    }
                        .foregroundColor(.black)
                        .overlay(
                        Image("pnpLogonbg")
                            .resizable()
                            .frame(width: 150, height: 100)
                            .clipShape(Circle().size(width: 150, height: 100)))
                    Spacer()
                    //MARK: SEARCH ICON
                    HStack(spacing: 10) {

                        Image(systemName: "magnifyingglass")
                        TextField("Search ..", text: $searchText)
                            .searchable(text: $searchText)
                    }
                    Spacer()
                    // END SEARCH ICON

                    //MARK: - BODY TOP
                    HStack {
                        Text("Results for: \(searchText)")
                            .font(.title.bold())
                        Spacer()
                        Button {

                        } label: {
                      
                        }
                    } // END BODY TOP
                    .padding(.top, 10)

                    //MARK: - CATEGORY LIST SLIDER
                    ScrollView(.horizontal, showsIndicators: false) {
                        //MARK: - CATEGORY LIST
                        HStack(spacing: 18) {
                            CategoryItem(image: "cat8", title: "Auto")

                            CategoryItem(image: "cat7", title: "Offers")

                            CategoryItem(image: "cat6", title: "Health Care")

                            CategoryItem(image: "cat5", title: "Backpack")

                            CategoryItem(image: "cat4", title: "Facewash")

                            CategoryItem(image: "cat3", title: "Skin Care")

                            CategoryItem(image: "cat2", title: "Used Cars")

                            CategoryItem(image: "cat1", title: "Backpack")
                        } // END CATEGORY LIST
                        .padding(.vertical)
                    }
                    //MARK: - PRODUCT LIST
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

                    // MARK: - GRID VIEW
                    LazyVGrid(columns: columns, spacing: 18) {
                        ForEach(searchResults) { product in
                            CardView(product: product)
                                .onTapGesture {
                                withAnimation {
                                    baseData.currentProduct = product
                                    baseData.suggestedProducts.append(product)
                                    baseData.showDetail = true
                                }
                            }
                        }
                    }

                    Spacer()


                }
                    .padding()
                    .background(
                    Image(DBHelper.db.getImageData())
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.1)
                )
                //MARK: - Bottom Tab Bar Approx Padding
//            .padding(.bottom, 100)
            }
                .overlay(
                DetailView(animation: animation)
                    .environmentObject(baseData)
            )
        }
            .padding()
    }

    var searchResults: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return productsForFiltering.filter { $0.tags!.contains(searchText) }
        }
    }

    //MARK: PRODUCT VIEW
    @ViewBuilder
    func CardView(product: Product) -> some View {
        VStack(spacing: 15) {

            //MARK: LIKED BUTTON Adds to Wishlist
            Button {
                DBHelper.db.updateUserWishList(email: currentUser.email!, product: product)
                self.baseData.currentProduct?.isLiked = true
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 13))
                    .foregroundColor(product.isLiked ? .red : .black)
                    .padding(5)
                    .background(
                    Color.red.opacity(product.isLiked ? 1 : 0), in: Circle()
                )
            } // END LIKED BUTTON
            .frame(maxWidth: .infinity, alignment: .trailing)

            //MARK: - PRODUCT IMAGE
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: product.image, in: animation)
                .padding()
                .rotationEffect(.init(degrees: -20))
                .background(
                ZStack {
                    Circle()
                        .fill(Color(product.color))
                        .padding(-10)
                    //MARK: - INNER CIRCLE
                    Circle()
                        .stroke(Color.white, lineWidth: 1.4)
                        .padding(-3)
                }
            ) // END PRODUCT IMAGE

            //MARK: PRODUCT TITLE
            Text(product.name!)
                .fontWeight(.semibold)
                .padding(.top)

            //MARK: - PRODUCT PRICE
            Text(String(product.price))
                .font(.title2.bold())

            //MARK: - RATIING
            HStack(spacing: 4) {
                ForEach(1...5, id: \.self) { index in
                    Button(action: {
//                        withAnimation{ product.rating = index }
                    }) {
                    }
                    Image(systemName: "star.fill")
                        .font(.system(size: 9.5))
                        .foregroundColor(product.rating >= index ? .yellow : Color.gray.opacity(0.6))
                }

                Text("(\(product.rating).0)")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
            }

        }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
    }

    //MARK: CATEGORY VIEW Filters by category, can see offers here
    @ViewBuilder
    func CategoryItem(image: String, title: String) -> some View {
        Button {
            withAnimation { baseData.category = title }
            withAnimation { baseData.homeTab = title }

            let filtered = productsForFiltering.filter { $0.tags?.first == baseData.category }

            baseData.products = filtered

            //To Filter without higher order functions
//            for (i, product) in baseData.products.enumerated() {
//
//                if filtered.indices.contains(i) {
//                    baseData.products[i] = filtered[i]
//                } else {
//
//                }
//
//            }

        } label: {
            HStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                Text(title)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(

                ZStack {
                    //MARK: - TRANSITION SLIDER
                    if baseData.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }

            )
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

