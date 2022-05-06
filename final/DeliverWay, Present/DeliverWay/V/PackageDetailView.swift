//
//  PackageDetailView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct PackageDetailView: View {
    @EnvironmentObject var packageData: ListViewModel

    var index: Int = 0
    
    var body: some View {
        VStack(alignment: .leading,
        spacing: 4) {
            Spacer()
            Text("Your Shipment")
                
            
            if packageData.packageModels.count > 0 {
                Text(packageData.packageModels[index].packageName)
                    .font(.title2.bold())
            } else {
                Text("")
                    .font(.title2.bold())
            }
            
            Spacer()
            
            Text("Carrier")
            
            Text(packageData.packageModels[index].companyName)
                .font(.title2.bold())
            Spacer()
        }
        .frame(width: UIScreen.screenWidth,
               height: 140,
               alignment: .leading)
        .padding(.leading)
        .background(Color.white)
        .cornerRadius(15)
//        .shadow(radius: 10,
//                x: 0,
//                y: 10)
    }
}

struct PackageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PackageDetailView()
    }
}
