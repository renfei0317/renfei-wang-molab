//
//  ContentView.swift
//  DeliverWay
//
//  Created by Renfei Wang on 2022/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var packageData: ViewModel = ViewModel()
    
    @StateObject var locationViewModel = LocationModel()
    
    let color: Color = Color(UIColor.lightGray.lighter()!)
    
    var body: some View {
        
        NavigationView {
            if packageData.count != 0 {
                ScrollView {
                    VStack(spacing: 25) {
                        Spacer()
                        NewAddPackageView()
                            .environmentObject(packageData)
                        HStack {
                            Text("Today")
                                .bold()
                                .foregroundColor(Color(UIColor.lightGray))
                            Spacer()
                        }
                        if packageData.count >= 1 {
                            NavigationLink(destination: DetailMapView()) {
                                HomeMapCell(
                                    packageName: packageData.packageModels[0].packageName,
                                    imageName: packageData.packageModels[0].companyName.lowercased(),
                                    companyName: packageData.packageModels[0].companyName)
                                .foregroundColor(.black)
                                .padding(.all, 10)
                                .background(.white)
                                .cornerRadius(8)
                            }
                        }
                        HStack {
                            Text("On the way")
                                .bold()
                                .foregroundColor(Color(UIColor.lightGray))
                            Spacer()
                        }
                        if packageData.count > 1 {
                            ForEach(packageData.packageModels[1...]) { item in
                                ListOnTheWayView(packageName: item.packageName,
                                                 imageName: item.companyName.lowercased(),
                                                 companyName: item.companyName)
                                .padding(.all)
                                .background(.white)
                                .cornerRadius(5)
                            }
                        }
                    }.environmentObject(packageData)
                        .background(color)
                        .padding([.leading, .trailing], 15)
                }
                .background(color)
                //                .padding([.leading, .trailing], 20)
                .navigationTitle("My Package")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: LeftProcView(count: packageData.count))
            } else {
                VStack {
                    
                    Spacer()
                    AddPackageButton()
                        .environmentObject(packageData)
                    Spacer()
                }
                .navigationTitle("My Package")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: LeftProcView(count: 0))
            }
        }
        .onAppear {
            locationViewModel.requestAuthorisation()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
