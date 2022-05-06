//
//  ShipmentView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct ShipmentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            SingleItem(title: "Shipper",
                       subTitle: "Los Angeles, CA US")
            
            SingleItem(title: "Receiver",
                       subTitle: "Manhattan, NY US")
            
            SingleItem(title: "Package Information",
                       subTitle: "Service Level: UPS Ground",
                       descr: "Weight: 1.6lb")
            
            Text("Shipment Progress")
                .bold()
            
            Text("04/29/2022")
                .foregroundColor(Color.gray)
            
            TimelineView(time: "15:17",
                         proccess: "Out for delivery",
                         address: "Mahattan, NY")
            
            TimelineView(time: "14:41",
                         proccess: "Arrived at Facility",
                         address: "Manhattan, NY")
            
            TimelineView(time: "10:57",
                         proccess: "Departed from Facility",
                         address: "Los Angeles, CA")
            
            TimelineView(time: "09:49",
                         proccess: "Origin Scan",
                         address: "Los Angeles, CA")
            
            TimelineView(time: "08:24",
                         proccess: "Label Created",
                         address: "Los Angeles, CA")


            
            
            
            
        }
        .padding(.leading, 15)
    }
}

struct ShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentView()
    }
}
