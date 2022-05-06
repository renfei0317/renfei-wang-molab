//
//  PackageModel.swift
//  DeliverWay
//
//  Created by Renfei on 2022/4/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var packageModels: [PackageModel] = []
    var count = 0
    
    init() {
        
    }
    
    init(data: [PackageModel]) {
        for (index, item) in data.enumerated() {
            let companyName: String = item.packageName.starts(with: "1Z") ? "UPS" : "FedEx"
            packageModels.append(PackageModel(id: index, packageName:  item.packageName, companyName: companyName))
            count += 1
        }
    }
    
    func add(packageName: String) {
        let companyName: String = packageName.starts(with: "1Z") ? "UPS" : "FedEx"
        packageModels.append(PackageModel(id: count, packageName: packageName, companyName: companyName))
        count += 1
    }
}

class ListViewModel: ObservableObject {
    @Published var packageModels: [PackageModel] = []
    var count = 0
    
    init() {
        
    }
    
    init(data: [PackageModel]) {
        for (index, item) in data.enumerated() {
            packageModels.append(PackageModel(id: index, packageName:  item.packageName, companyName: item.companyName))
            count += 1
        }
    }
    
    func add(packageName: String) {
        let companyName: String = packageName.starts(with: "1Z") ? "UPS" : "FedEx"
        packageModels.append(PackageModel(id: count, packageName: packageName, companyName: companyName))
        count += 1
    }
    
    func remove() {
        packageModels = []
        count = 0
    }
}

struct PackageModel: Identifiable {
    var id: Int = 0
    
    var packageName: String = ""
    
    var companyName: String = ""
}
