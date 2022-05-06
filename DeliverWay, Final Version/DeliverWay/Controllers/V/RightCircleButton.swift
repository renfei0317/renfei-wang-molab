//
//  RightCircleButton.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI

struct RightCircleButton: View {
    var popAction: () -> Void = {  }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    popAction()
                } label: {
                    Image("close_view_b")
                        .resizable()
                        .frame(width: 50,
                               height: 50)
                        .foregroundColor(Color(UIColor.lightGray))
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.trailing, 20)
            }
            .padding(.top, 40)
            Spacer()
        }
    }
}

struct RightCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        RightCircleButton()
    }
}
