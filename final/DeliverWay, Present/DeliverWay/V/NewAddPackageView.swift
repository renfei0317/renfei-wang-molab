//
//  NewAddPackageView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct NewAddPackageView: View {
    @EnvironmentObject var packageData: ViewModel
    
    var body: some View {
        NavigationLink(destination: PackageListView().environmentObject(packageData)) {
            HStack(alignment: .center) {
                Image("add_search")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,
                           height: 40)
                Text("Add your tracking number")
                Spacer()
            }
            .padding(.all, 15)
            .background(Color(UIColor.lightGray))
            .foregroundColor(.black)
            .cornerRadius(10)
        }
    }
}

struct NewAddPackageView_Previews: PreviewProvider {
    static var previews: some View {
        NewAddPackageView()
    }
}
