//
//  HomeListView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct HomeListView: View {
    @EnvironmentObject var dataModel: ViewModel
    
    var index: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ups",
                      bundle: Bundle.main)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50,
                           height: 60)
                Text("UPS")
                
                Spacer()
            }
                
            
            
            Text(dataModel.packageModels[index].packageName)
                .font(.title3.bold())
            
            Text("Departed from facility")
                .font(.subheadline)
        }
        .frame(width: UIScreen.screenWidth,
               height: 120)
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(radius: 10,
//                x: 0,
//                y: 10)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
