//
//  Home.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/6/22.
//

import SwiftUI

struct Home: View {
    //MARK: - GEOMETRY EFFECT
    // @Namespace property wrapper to create a global namespace for your views. In practice this isn’t anything other than a property on your view, but behind the scenes this lets us attach views together.
    @Namespace var animation
    @StateObject var baseData: HomeViewModel = HomeViewModel()
    @Environment(\.currentUser) var currentUser

    //Scroll view sliders
    @State var currentSlider: Int = 0
    @State var sliders: [Slider] = []
    
    //Search and Sort variables
    @State var searchText: String = ""
    @State private var sort: Int = 0

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                Spacer()
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

                    //MARK: SEARCH ICON

                    Button(action: {

                    }) {
                        NavigationLink(destination: SearchView() .background(
                                Image(DBHelper.db.getImageData())
                                    .resizable()
                                    .ignoresSafeArea()
                                    .opacity(0.1)
                            )) {
                            HStack(spacing: 10) {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        }
                    }

                    // END SEARCH ICON
                }
                    .foregroundColor(.black)
                    .overlay(
                    Image("appLogonbg")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .clipShape(Circle().size(width: 150, height: 100)))
                    .padding(.top, 15)
                // END APP BAR
                
                //MARK: SLIDER
                VStack() {
                    VStack(alignment: .leading, spacing: -1) {
                        Text("Welcome")
                            .font(.title.bold())
                        HomeSlider(trailingSpace: 40, index: $currentSlider, items: sliders) { slider in
                            GeometryReader { proxy in
                                
                                let sliderSize = proxy.size
                                
                                Image(slider.sliderImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: sliderSize.width)
                                    .cornerRadius(12)
                            }
                        }
                    }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .onAppear {
                        for index in 1...7 {
                            sliders.append(Slider(sliderImage: "slider\(index)"))
                        }

                    }
                    //prevents sliders from adding infinately
                    .onDisappear {
                        sliders.removeAll()
                    }

                } // END SLIDER
                .padding(.bottom, 20)
                    .frame(width: 400, height: 200)
                    .fixedSize() // Prevents side effects of infinite zoom when switching tabs.
                    .padding(.top, 5)

                //MARK: - SLIDER INDICATOR

                HStack(spacing: 10) {
                    ForEach(sliders.indices, id: \.self) { index in
                        Circle()
                            .fill(Color.black.opacity(currentSlider == index ? 1 : 0.1))
                            .frame(width: 7, height: 8)
                            .scaleEffect(currentSlider == index ? 1.4 : 1)
                            .animation(.spring(), value: currentSlider == index)
                    }
                }
                    .frame(width: 50, height: 10)
                    .fixedSize()
                    .padding(.top, 10)

                //MARK: - BODY TOP
                HStack {
                    Text("Products: \(baseData.category)")
                        .font(.title.bold())
                        .frame(width: 300, height: 0, alignment: .leading)
                    Spacer()
                    Button {

                    } label: {
                        HStack(spacing: 3) {
                            Menu {
                                Button("Price: Low to High", action: sortByAscPrice)
                                Button("Price: High to Low", action: sortByDesPrice)
                            } label: {
                                Text("Sort by")
                                    .font(.caption.bold())
                                Image(systemName: "chevron.down")
                                    .font(.caption.bold())
                            }
                        }
                            .foregroundColor(.gray)
                    }
                } // END BODY TOP
                .padding(.top, 10)
                    .fixedSize()
                //MARK: - CATEGORY LIST SLIDER
                ScrollView(.horizontal, showsIndicators: false) {
                    //MARK: - CATEGORY LIST
                    HStack(spacing: 18) {
                        CategoryItem(image: "cat1", title: "Auto")

                        CategoryItem(image: "cat2", title: "Offers")

                        CategoryItem(image: "cat3", title: "Health Care")

                        CategoryItem(image: "cat4", title: "Backpack")

                        CategoryItem(image: "cat5", title: "Facewash")

                        CategoryItem(image: "cat6", title: "Skin Care")

                        CategoryItem(image: "cat7", title: "Used Cars")

                        CategoryItem(image: "cat8", title: "Backpack")
                    } // END CATEGORY LIST
                    .padding(.vertical)
                }
                //MARK: - PRODUCT LIST
                //can make fixed and pass value by iPhone type.
                //This fixes the zoom in bug when switching tabs and back to Home
                //make .flexible to recreate bug
                let columns = Array(repeating: GridItem(.fixed(190), spacing: 15), count: 2)

                // MARK: - GRID VIEW
                // Lazy View Stacks are used to improve performance. Grid is native solution for collection vire Also look into List or https://www.youtube.com/watch?v=BD9vzG0qUXc
                //Lazy Grid details https://www.appcoda.com/learnswiftui/swiftui-gridlayout.html
                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(baseData.products) { product in
                        CardView(product: product)
                            .onTapGesture {
                            withAnimation {
                                baseData.currentProduct = product
                                //logic for how we want suggested items to work here.
                                //For now we simply keep track of all items users clicked. We can use tags or other ways to add to suggested products list
                                baseData.suggestedProducts.append(product)
                                baseData.showDetail = true
                            }
                        }
                    }
                    // .id(UUID()) For better performance, test and research using this
                    // bug with laggy screen transition seem to be something else
                    //https://www.hackingwithswift.com/articles/210/how-to-fix-slow-list-updates-in-swiftui
                    .id(UUID())
                }

                Spacer()

                HStack {
                    Text("Suggested: ")
                        .font(.title.bold())
                    Spacer()
                    Button {

                    } label: {
                        HStack(spacing: 3) {
                            Text("Sort by")
                                .font(.caption.bold())
                            Image(systemName: "chevron.down")
                                .font(.caption.bold())
                        }
                            .foregroundColor(.gray)
                    }
                } // END BODY TOP
                .padding(.top, 10)

                //MARK: - PRODUCT LIST
                let columns_sug = Array(repeating: GridItem(.fixed(190), spacing: 15), count: 2)

                // MARK: - GRID VIEW
                LazyVGrid(columns: columns_sug, spacing: 18) {
                    ForEach(baseData.suggestedProducts ?? []) { product in
                        CardView(product: product)
                            .onTapGesture {
                            withAnimation {
                                baseData.currentProduct = product
                                baseData.showDetail = true
                            }
                        }
                    }
                }
                    .id(UUID())
            }
                .padding()
                .background(
                Image(DBHelper.db.getImageData())
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.1))
            //MARK: - Bottom Tab Bar Approx Padding
//            .padding(.bottom, 100)
        }
            .overlay(
            DetailView(animation: animation)
                .environmentObject(baseData))
            .padding(1)
    }

    //MARK: PRODUCT VIEW
    @ViewBuilder
    func CardView(product: Product) -> some View {
        VStack(spacing: 15) {

            //MARK: LIKED BUTTON Adds to Wishlist ---
            Button {
                let isLiked = false
                if (isLiked == true){
                    DBHelper.db.updateUserWishList(email: currentUser.email!, product: product)
                    product.isLiked.toggle()
                }
                else if (isLiked == false){
                   // DBHelper.db. removeWishList(email: currentUser.email!, product: product)
                    product.isLiked.toggle()
                }

            } label: {
                if product.isLiked {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 13))
                        .foregroundColor(product.isLiked ? .red : .gray)
                        .padding(5)
                        .background(
                        Color.red.opacity(0.3), in: Circle()
                    )
                } else {
                    Image(systemName: "suit.heart")
                        .font(.system(size: 13))
                        .foregroundColor(product.isLiked ? .red : .gray)
                        .padding(5)
                        .background(
                        Color.gray.opacity(0.3), in: Circle()
                    ) }

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
            )
            // MARK: For fetching images from url

//            AsyncImage(url: URL(string: "https://loremflickr.com/320/240/dog")) { image in
//                image.resizable()
//                    .frame(width: 100, height: 100)
//                //                .resizable()
//                //                .aspectRatio(contentMode: .fit)
//                .matchedGeometryEffect(id: product.image, in: animation)
//                    .padding()
//                    .rotationEffect(.init(degrees: -20))
//                    .background(
//                    ZStack {
//                        Circle()
//                            .fill(Color(product.color))
//                            .padding(-10)
//                        //MARK: - INNER CIRCLE
//                        Circle()
//                            .stroke(Color.white, lineWidth: 1.4)
//                            .padding(-3)
//                    }
//                )
//
//            } placeholder: {
//                ProgressView()
//            }
            // END PRODUCT IMAGE

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
            .background(Color.white.opacity(0.4), in: RoundedRectangle(cornerRadius: 12))
    }

    //MARK: CATEGORY VIEW Filters by category, can see offers here
    @ViewBuilder
    func CategoryItem(image: String, title: String) -> some View {
        Button {
            withAnimation { baseData.category = title }
            withAnimation { baseData.homeTab = title }

            let filtered = productsForFiltering.filter { $0.tags!.contains(baseData.category.lowercased()) }
            print("Filtered1-------------------------", filtered.count)
            if filtered.count == 0 {
                baseData.products = [Product(name: "Out of Stock", comments: [""], offer: false, price: 00.00, tags: ["empty", "error", "out of stock", "out"], image: "emptyError", color: UIColor(Color(.gray).opacity(0.4)), desc: "We are sorry. This item is not available. Please come back another time or call support at 555-555-5555", isLiked: false, rating: 5, isSaved: 0, quantity: 1)]
            } else {
                baseData.products = filtered

            }

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

    // MARK: Sort functions
    func sortByAscPrice() {
        withAnimation { baseData.category = "Low Price" }
        let sorted: [Product] = productsForFiltering.sorted { $0.price < $1.price }
        baseData.products = sorted
    }

    func sortByDesPrice() {
        withAnimation { baseData.category = "High Price" }
        let sorted: [Product] = productsForFiltering.sorted { $0.price > $1.price }
        baseData.products = sorted
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

