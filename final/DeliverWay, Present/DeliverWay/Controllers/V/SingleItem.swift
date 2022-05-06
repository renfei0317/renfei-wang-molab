//
//  SingleItem.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct SingleItem: View {
    var title: String
    var subTitle: String
    var descr: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .bold()
                    .fixedSize()
                Text(subTitle)
                    .fixedSize()
                if !descr.isEmpty {
                    Text(descr)
                }
            }
            Spacer()
        }
    }
}

struct SingleItem_Previews: PreviewProvider {
    static var previews: some View {
        SingleItem(
        title: "Shipper", subTitle: "Los Angeles, CA US", descr: "Hello")
    }
}
