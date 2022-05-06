//
//  ListOnTheWayView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct ListOnTheWayView: View {
    var packageName: String
    
    var imageName: String
    
    var companyName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(packageName)
                    .font(.title3)
                    .bold()
                Spacer()
                Text(companyName)
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
            }
            Text("Out for delivery")
                .foregroundColor(.gray)
            Text("1.5 mi · 60-80min")
        }
    }
}

struct ListOnTheWayView_Previews: PreviewProvider {
    static var previews: some View {
        ListOnTheWayView(packageName: "Hello World",
                         imageName: "ups",
        companyName: "UPS")
    }
}
