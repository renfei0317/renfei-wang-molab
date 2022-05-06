//
//  AnnotatedItem.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/2.
//

import MapKit
import Foundation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var isPop: Bool = false
}
