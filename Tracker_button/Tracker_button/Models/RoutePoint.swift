//
//  RoutePoint.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 12/12/2022.
//

import Foundation
import MapKit

struct RoutePoint: Identifiable {
    var id = UUID()
    let lat: Double
    let lon: Double
    
    var coor: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
    }
}
