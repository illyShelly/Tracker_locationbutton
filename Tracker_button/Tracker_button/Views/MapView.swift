//
//  MapView.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 11/12/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    //    Pull out the object from main - where is initialized
    @EnvironmentObject private var manager: LocationManagerViewModel
    
//    @StateObject var locationManager = LocationManager()
    @State var tracking: MapUserTrackingMode = .follow
    
    var body: some View {
        let span = manager.region.span
        let center = manager.region.center
        
        let loc1 = CLLocation(latitude: center.latitude - span.latitudeDelta * 0.5, longitude: center.longitude)
        let loc2 = CLLocation(latitude: center.latitude + span.latitudeDelta * 0.5, longitude: center.longitude)
        
        let loc3 = CLLocation(latitude: center.latitude, longitude: center.longitude - span.longitudeDelta * 0.5)
        let loc4 = CLLocation(latitude: center.latitude, longitude: center.longitude + span.longitudeDelta * 0.5)
        
        let metersInLatitude = loc1.distance(from: loc2)
        let metersInLongitude = loc3.distance(from: loc4)
        let radius = max(metersInLatitude, metersInLongitude) / 2.0
        
        VStack {
            Text("\(manager.region.center.latitude)")
            Text("\(manager.region.center.longitude)")
            Text("\(metersInLatitude)")
            Text("\(metersInLatitude)")
            Text("\(radius)")
            // without double "" -> err: No exact matches in call to initializer
            
            // MapInteractionModes - .pan or .zoom or allow both .all
            // showsUserLocation - show a marker
            Map(coordinateRegion: $manager.region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $tracking
            )
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationManagerViewModel())
    }
}
