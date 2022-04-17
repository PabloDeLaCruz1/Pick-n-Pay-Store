//
//  TrackingInfo.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/8/22.
//
//this is for shipping item details. 
import SwiftUI

struct ItemShippingInfoView: View {
    var body: some View {
        VStack{
            HStack{
            Text("Your \(" (item name)") is")
            .font(.title2)
            Spacer()
            }.padding([.leading, .trailing], 10)
        HStack{
            ZStack{
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color.gray.opacity(0.2))
            //cart image name
            Image(systemName: "cart.fill")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
        }
         Text("Arriving Monday")
                .font(.title)
                .padding(.all, 15)
                .foregroundColor(Color.blue)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Spacer()
            Button(action: {
                //cancel button tapped
            }, label: {
                Text("cancel")
                    .font(.body)
                    .padding([.all], 8)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(7)
            })
                .shadow(radius: 5)
            
            Spacer()
            
        }.padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 10)
        }.padding([.top], 10)
        
    }
}

struct TrackingInfo_Previews: PreviewProvider {
    static var previews: some View {
        //the view is smaller
        ItemShippingInfoView().previewLayout(.sizeThatFits)
    }
}
