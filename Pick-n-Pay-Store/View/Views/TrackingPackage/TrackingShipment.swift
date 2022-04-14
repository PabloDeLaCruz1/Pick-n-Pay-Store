//
//  TrackingShipment.swift
//  Pick-n-Pay-Store
//
//  Created by Stephanie Marin Velasquez on 4/9/22.
//

import SwiftUI

struct TrackingShipment: View {
    var body: some View {
        NavigationView{
            ScrollView{
            ItemInfoView()
            Divider()
                VStack(spacing: 0){
                TrackProgressView(date: "April 1", status: "Packed",icon: "p.circle.fill", isFirst: true, isLast: false  ).previewLayout(.sizeThatFits)
                TrackProgressView(date: "April 2", status: "In transit",icon: "i.circle.fill", isFirst: false, isLast: false  ).previewLayout(.sizeThatFits)
                TrackProgressView(date: "April 5", status: "Out for delivery",icon: "o.circle.fill", isFirst: false, isLast: false  ).previewLayout(.sizeThatFits)
                TrackProgressView(date: "April 5", status: "Delivered",icon: "d.circle.fill", isFirst: true, isLast: true  ).previewLayout(.sizeThatFits)
                }
            }
            
            .navigationTitle(Text("Tracking Package"))
        }
    }
}

struct TrackingShipment_Previews: PreviewProvider {
    static var previews: some View {
        TrackingShipment()
    }
}
