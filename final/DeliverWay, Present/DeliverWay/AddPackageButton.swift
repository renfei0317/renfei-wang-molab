//
//  AddPackageButton.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct AddPackageButton: View {
    
    @EnvironmentObject var packageData: ViewModel
    
    var body: some View {
        NavigationLink(destination: PackageListView().environmentObject(packageData)) {
            VStack {
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,
                           height: 30)
                
                
                Text("Add your package")
                
                Spacer()
            }
            .frame(width: 180, height: 80, alignment: .center)
            .background(Color(UIColor.lightGray))
            .cornerRadius(15)
        }
        .foregroundColor(.black)
        
    }
}
