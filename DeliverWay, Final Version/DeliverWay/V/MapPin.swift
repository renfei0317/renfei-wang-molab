//
//  MapPin.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/2.
//

import SwiftUI

struct MapPin: View {
    @State private var showCallout = false
    
    let title: String
    let subtitle: String?
    let color: Color
//    @Binding var isSelected: Bool?
    let isPop: Bool
    
    init(title: String, subtitle: String? = nil, color: Color, isPop: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        self.isPop = isPop
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text(title)
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(5)
                
                
//                Text(subtitle ?? "")
//                    .font(.callout)
//                    .padding(5)
//                    .opacity(showCallout && (subtitle != nil) ? 1 : 0)
            }
            .background(.black)
            .cornerRadius(5)
            .opacity(isPop ? 1 : 0)
            
            Image(isPop ? "box_on" : "box_off")
                .resizable()
                .frame(width: 30,
                       height: 30)
                .font(.title)
                .foregroundColor(color)
            
//            Image(systemName: "arrowtriangle.down.fill")
//                .font(.caption)
//                .foregroundColor(color)
//                .offset(x: 0, y: -5)
        }
        .onTapGesture {
            showCallout.toggle()
        }
//        .onLongPressGesture {
//            if let _ = isSelected {
//                self.isSelected!.toggle()
//            }
//        }
    }
}


struct MapPin_Previews: PreviewProvider {
    static var previews: some View {
        MapPin(title: "Renfei", color: .red, isPop: false)
    }
}
