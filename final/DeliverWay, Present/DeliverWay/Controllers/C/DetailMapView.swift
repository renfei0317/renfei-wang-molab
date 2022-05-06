//
//  DetailMapView.swift
//  DeliverWay
//
//  Created by Renfei on 2022/5/3.
//

import SwiftUI
import MapKit

struct DetailMapView: View {
    private var pointsOfInterest = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.747712, longitude:-73.989722)),
        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428), isPop: true)
    ]
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var isPaddingLess: Bool = false
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.741112, longitude: -73.985428), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                showsUserLocation: true,
                userTrackingMode: $trackingMode,
                annotationItems: pointsOfInterest) { location in
                MapAnnotation(coordinate: location.coordinate, content: {
                    
                    MapPin(title: "Lastest delivery",
                           subtitle: "Hello",
                           color: Color.red,
                           isPop: location.isPop)
                }
                )
            }
            RightCircleButton(popAction: {
                mode.wrappedValue.dismiss()
            })
            SnapDrawer(large: .paddingToTop(40),
                       medium: .fraction(0.4),
                       tiny: .height(40),
                       allowInvisible: false) { state in
                
                VStack {
                    
                    DetailMContentView()
                        .background(.white)
                        .cornerRadius(15)
                        .background(.clear)
                }
                //                .frame(width: UIScreen.screenWidth,
                //                       height: .infinity)
            }
            
            
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top)
        
        
    }
}

struct DetailMapView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMapView()
    }
}
