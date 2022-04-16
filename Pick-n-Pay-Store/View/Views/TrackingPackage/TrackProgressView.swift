//
//  TrackProgressView.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/9/22.
// editing line colors. 

import SwiftUI

enum TrackingState{
    case inProgress
    case completed
    case upComing
}

struct TrackProgressView: View {
    
    var date: String
    var status: String
    var icon: String
     
    var isFirst: Bool
    var isLast: Bool
    
    var state : TrackingState
    
    var body: some View {

        HStack{
            Text(date)
                .frame(width: 80)
                //opacity for text color during upComing
                .opacity(self.state == .upComing ? 0.5 : 1.0)
            ZStack{
                VStack{
                    Rectangle()
                        .frame(width: 7, height: 50)
                        .foregroundColor(Color.orange.opacity(0.2))
                        //opacity for line color connection to next track
                        .opacity(self.isFirst ? 0.0 : 1.0)
                    
                    Rectangle()
                        .frame(width: 7, height: 50)
                        .foregroundColor(Color.orange.opacity(0.2))
                        .opacity(self.isLast ? 0.0 : 1.0)
                }
                //in Progress shows both circles
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.orange.opacity(0.5))
                    .opacity(self.state == .inProgress ? 1.0 : 00)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.orange.opacity(0.8))
               
                    
            }
            
            .opacity(self.state == .upComing ? 0.5 : 1.0)
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
                .opacity(self.state == .upComing ? 0.5 : 1.0)
                
            Spacer()
        }
    }
}

struct TrackProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgressView(date: "April 5", status: "Packed",icon: "a.circle.fill", isFirst: false, isLast: false, state: .inProgress  ).previewLayout(.sizeThatFits)
    }
}
