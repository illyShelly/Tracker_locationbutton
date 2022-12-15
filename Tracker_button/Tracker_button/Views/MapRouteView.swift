//
//  MapRouteView.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 14/12/2022.
//

import SwiftUI
import MapKit

struct MapRouteView: View {
    
    @EnvironmentObject var managerVM: LocationManagerViewModel
    
    @StateObject private var routePointVM = RoutePointVM()
    
    @State var points: [RoutePoint] = [] //<-


    var body: some View {

        VStack {
            Text("No way")
//            points = routePointVM.getArrayOfPoints(manager: managerVM)
            
//            Map(coordinateRegion: $managerVM.region,
//                annotationItems: points)
//                   { point in
//                       MapMarker(coordinate: point),
//                              tint: Color.purple)
//                   }
            
            
        }
    }
}

struct MapRouteView_Previews: PreviewProvider {
    static var previews: some View {
        MapRouteView()
    }
}

//Err: Cannot use mutating member on immutable value: 'self' is immutable
//Solution: points needs to be @State

//Err:
//Cannot assign to property: 'self' is immutable for var pin: RoutePoint
//ForEach -> type '()' cannot conform to 'View' -> User for loop
//https://stackoverflow.com/questions/63199788/foreach-loop-inside-button-action-block-throws-type-cannot-conform-to-view

//Err:
//Closure containing control flow statement cannot be used with result builder 'ViewBuilder'

//
//The ForEach confirms to View, so at its core, it is a View just like a TextField. ForEach Relationships
//You can't use a normal for-in because the ViewBuilder doesn't understand what is an imperative for-loop. The ViewBuilder can understand other control flow like if, if-else or if let using buildEither(first:), buildEither(second:), and buildif(_:) respectively.

//Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'CLLocation' conform to 'Identifiable'
