//
//  CommentsView.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/17/22.
//

import SwiftUI

struct CommentsView: View {
    
    @EnvironmentObject var baseData: HomeViewModel
    var body: some View {
        
        if var product = baseData.currentProduct{
        VStack{
            
        HStack{
            //image username and name
            ZStack{
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color.gray.opacity(0.1))
            //cart image name
            Image(systemName: "person")
                .font(.largeTitle)
                .foregroundColor(Color.init(red: 1.00, green: 0.49, blue: 0.53))
            } .padding()
            VStack{
                Text("User Name").font(.caption)
                //Item title name
                Text(product.name!)
            }
            Spacer()
        }
            //comment string
            HStack{
                Text("This beauty product is amazing! and the shipping was fast!").padding()
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView().previewLayout(.sizeThatFits)
    }
}
