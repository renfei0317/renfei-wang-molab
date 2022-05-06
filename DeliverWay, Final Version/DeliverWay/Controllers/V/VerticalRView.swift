//
//  VerticalRView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct VerticalRView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image("time_now")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,
                           height: 30)
                    .foregroundColor(.green)
                Text("Be prepared! You'll have your package in 60-80 minutes!")
                    .font(.title3)
                    .bold()
            }
            .padding(.all)
            .background(Color(UIColor.lightGray.lighter()!))
            .cornerRadius(15)
            HStack {
                Text("Route Details")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            RouteViewCell(index: 0,
                          time: "15:37",
                          title: "Vehicle is 1.7 miles away from you",
                          subTitle: "Estimated delivery in 60-80 mins")
            RouteViewCell(index: 1,
                          time: "15:31",
                          title: "Vehicle is 1.9 miles away from you",
                          subTitle: "Estimated delivery in 60-80 mins")
            RouteViewCell(index: 2,
                          time: "15:24",
                          title: "Vehicle is 2.2 miles away from you",
                          subTitle: "Estimated delivery in 70-90 mins")
        }
        .padding(.leading, 15)
    }
}

struct VerticalRView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalRView()
    }
}
