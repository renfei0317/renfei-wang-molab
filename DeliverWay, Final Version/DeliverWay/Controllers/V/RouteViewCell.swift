//
//  RouteViewCell.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct RouteViewCell: View {
//    var isLastest: Bool
    var index: Int
    
    var time: String
    
    var title: String
    
    var subTitle: String
    
    
    var body: some View {
        let color: Color = index == 0 ? .black : Color(UIColor.lightGray)
        
        VStack(alignment: .leading) {
            if index == 0 {
                HStack {
                    Text("Lastest Delivery")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Rectangle()
                        .fill(.yellow)
                        .frame(height: 1, alignment: .center)
                        .padding(.trailing, 20)
                }
            }
            
            HStack {
                VStack {
                    Text(time)
                        .foregroundColor(color)
                    DottedLine()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .frame(width: 1, height: 20)
                    
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(color)
                    Text(subTitle)
                        .bold()
                        .foregroundColor(color)
                }
                .padding(.leading)
                Spacer()
            }
        }
    }
}

struct RouteViewCell_Previews: PreviewProvider {
    static var previews: some View {
        RouteViewCell(index: 0,
                      time: "15:37",
        title: "This should be some text here",
        subTitle: "This should be some text here")
    }
}
