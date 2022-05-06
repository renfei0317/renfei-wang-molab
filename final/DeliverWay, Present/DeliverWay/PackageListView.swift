//
//  PackageListView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import SwiftUI

struct PackageListView: View {
    
    @EnvironmentObject var environmentModel: ViewModel
    
    @ObservedObject var observeModel: ListViewModel = ListViewModel()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            SearchTextField(cancelAction: {
                observeModel.remove()
            }, tapAction: { packName in
                observeModel.add(packageName: packName)
            })
            List(observeModel.packageModels) { item in
                PackageDetailView(index: item.id)
                    .environmentObject(observeModel)
            }
            Spacer()
            if observeModel.count != 0 {
                Button(action: {
                    environmentModel.add(packageName: observeModel.packageModels[0].packageName)
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Confirm")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(width: 180,
                       height: 50)
                .background(Color.yellow)
                .cornerRadius(15)
                .padding()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("New Package")
                    .font(.title3.bold())
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
}

struct PackageListView_Previews: PreviewProvider {
    static var previews: some View {
        PackageListView()
    }
}
