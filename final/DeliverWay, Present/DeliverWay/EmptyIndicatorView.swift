//
//  EmptyIndicatorView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct EmptyIndicatorView: View {
    
    @EnvironmentObject var packageData: ViewModel
    
    var body: some View {
        VStack {
            Image("box",
                  bundle: Bundle.main)
                .resizable()
                .scaledToFit()
                .frame(width: 180,
                       height: 80)
                
            AddPackageButton()
                .padding(.top, 20)
                .environmentObject(packageData)
        }
        .frame(alignment: .center)
    }
}
