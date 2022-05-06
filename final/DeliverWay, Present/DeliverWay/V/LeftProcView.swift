//
//  LeftProcView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/2.
//

import SwiftUI

struct LeftProcView: View {
    var count: Int
    
    var body: some View {
        HStack {
            Image("normal_box")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,
                       height: 40)
            VStack(alignment: .leading) {
                Text("\(count)")
                    .font(Font.title2)
                    .bold()
                Text("Processing")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.leading, 10)
        .frame(width: UIScreen.screenWidth - 10)
    }
}

struct LeftProcView_Previews: PreviewProvider {
    static var previews: some View {
        LeftProcView(count: 1)
    }
}
