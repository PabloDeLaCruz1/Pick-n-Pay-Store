//
//  TrackProgressView.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/9/22.
//

import SwiftUI

struct TrackProgressView: View {
    
    var date: String
    var status: String
    var icon: String
     
    var isFirst: Bool
    var isLast: Bool
    
    var body: some View {

        HStack{
            Text(date)
                .frame(width: 80)
            ZStack{
                VStack{
                    Rectangle()
                        .frame(width: 10, height: 50)
                        .foregroundColor(Color.orange.opacity(0.2))
                        .opacity(self.isFirst ? 0.0 : 1.0)
                    
                    Rectangle()
                        .frame(width: 10, height: 50)
                        .foregroundColor(Color.orange.opacity(0.2))
                        .opacity(self.isLast ? 0.0 : 1.0)
                }
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.orange.opacity(0.5))
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.orange.opacity(0.8))
               
                    
            }
            HStack{
                Image(systemName: icon)
                .font(.title)
                .foregroundColor(.orange)
            Text(status)
                .font(.title)
                Spacer()
            }.padding(.all, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
            Spacer()
        }
    }
}

struct TrackProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgressView(date: "April 5", status: "Packed",icon: "a.circle.fill", isFirst: false, isLast: false  ).previewLayout(.sizeThatFits)
    }
}
