//
//  MapRouteView.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 14/12/2022.
//

import SwiftUI
import MapKit

struct MapRouteView: View {
    
    @EnvironmentObject var manager: LocationManagerViewModel
    @StateObject var routePointVM = RoutePointVM()
    
    var body: some View {
        Text("hi")
            // If data available in walking array from LocalManager
//            if manager.walkingArr! != [] {
//
//                ForEach(manager.walkingArr!, id: \.self) { pointCoor in
//                    RoutePoint(lat: pointCoor.coordinate.latitude, lon: pointCoor.coordinate.longitude)
//                }
//            }
        
    }
}

//struct MapRouteView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapRouteView(walkingArr: <#[CLLocation]#>)
//    }
//}
