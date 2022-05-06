//
//  DetailMContentView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct DetailMContentView: View {
    @State private var showGreeting: Bool = false
    
    @State private var segementTag: Int = 0
    
    var body: some View {
        ScrollView {
            HStack {
                Text("1Z123456789X")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.leading, 20)
            HStack {
                Image("ups")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,
                           height: 30)
                
                Text("UPS · Out for delivery")
                Spacer()
            }
            .padding(.leading, 10)
            .frame(width: UIScreen.screenWidth)
            Picker("What is your favorite color?", selection: $segementTag) {
                Text("Vehicle Route")
                    .font(.largeTitle)
                    .tag(0)
                Text("Shipment Details")
                    .font(.title)
                    .tag(1)
            }
            .padding([.leading, .trailing], 20)
            .pickerStyle(.segmented)
            
            if segementTag == 0 {
                VerticalRView()
            } else {
                ShipmentView()
            }
            

        }
        .frame(width: UIScreen.screenWidth,
               height: .infinity)
    }
}

struct DetailMContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMContentView()
    }
}
