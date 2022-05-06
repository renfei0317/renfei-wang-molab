//
//  HomeMapCell.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/2.
//

import SwiftUI
import MapKit

struct HomeMapCell: View {
    var packageName: String
    
    var imageName: String
    
    var companyName: String
    
    var pointsOfInterest = [
        AnnotatedItem(name: "Lastest Delivery", coordinate: .init(latitude: 40.741112, longitude: -73.989723), isPop: true)
    ]
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.741112, longitude: -73.985428), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Map(coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: $trackingMode,
                    annotationItems: pointsOfInterest) { location in
                    MapAnnotation(coordinate: location.coordinate, content: {
                        MapPin(title: location.name,
                               subtitle: "Hello",
                               color: Color.red,
                               isPop: location.isPop)
                    }
                    )
                }
                    .frame(width: .infinity,
                           height: 180)
                    .cornerRadius(15)
                Spacer()
            }
            HStack {
                Text(packageName)
                    .font(.title3)
                    .bold()
                Spacer()
                Text(companyName)
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
            }
            Text("Out for delivery")
                .foregroundColor(.gray)
            Text("1.5 mi · 50-70min")
        }
    }
}

struct HomeMapCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapCell(packageName: "Renfei",
                    imageName: "ups",
                    companyName: "UPS")
    }
}
