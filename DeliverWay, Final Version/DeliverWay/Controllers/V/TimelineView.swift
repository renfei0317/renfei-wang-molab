//
//  TimelineView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct TimelineView: View {
    var time: String
    
    var proccess: String
    
    var address: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Text(time)
            VStack(alignment: .leading, spacing: 8) {
                Text(proccess)
                Text(address)
            }
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(time: "15:17",
                     proccess: "Out for deliver",
                     address: "Manhattan, NY")
    }
}
