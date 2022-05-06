//
//  SearchTextField.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct SearchTextField: View {
    @State private var packageNumber: String = ""
    
    @State private var isShowCancel: Bool = false
    
    var cancelAction: () -> Void = {}
    
    var tapAction: (String) -> Void = { _ in }
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "plus")
                TextField("Enter your tracking number", text: $packageNumber)
                    .onSubmit {
                        if packageNumber.count > 0 {
                            tapAction(packageNumber)
                        }
                    }
                
                    
            }
            .padding([.leading, .trailing], 20)
            .frame(height: 50)
            .background(Color(UIColor.lightGray.lighter()!))
            .cornerRadius(15)
            Button(role: .destructive, action: {
                isShowCancel = false
                packageNumber = ""
                cancelAction()
            }) {
                Text("Cancel")
            }
//            .hidden(isShowCancel)
        }
        .padding([.leading, .trailing], 15)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField()
    }
}
