//
//  RoutePointVM.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 14/12/2022.
//

import Foundation

class RoutePointVM: ObservableObject {
    
    @Published var points: [RoutePoint] = []
    
    func getArrayOfPoints(manager: LocationManagerViewModel) {
        
        if manager.walkingArr != [] {
            
            for point in manager.walkingArr! {
                let pin = RoutePoint(lat: point.coordinate.latitude, lon: point.coordinate.longitude)
                points.append(pin)
            }
        }
        
    }
  
//       ForEach(LocationManagerViewModel.walkingArr!, id: \.self) { pointCoor in
//           pin = RoutePoint(lat: pointCoor.coordinate.latitude, lon: pointCoor.coordinate.longitude)
//           points.append(pin)
//       }
}
