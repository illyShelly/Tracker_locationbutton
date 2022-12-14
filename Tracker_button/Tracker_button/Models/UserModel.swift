//
//  UserModel.swift
//  Tracker_button
//
//  Created by Adriana Salomone on 13/12/22.
//

import Foundation
import MapKit
// import SwiftUI

struct User: Identifiable {
    var id = UUID()
    let lat: Double
    let lon: Double
    
    var activity: String
    var showOnMap: Bool = false
    
        //to set it visible on map. Button with activity symbol on modal should be connected to userActivity and -when selected- change it to true to show on MapView. Probably a switch fallthrough running on enum every time you close modal to check all cases (activities) --> (to give the chanche to show more than one activity at a time on the map).
    
    // var userActivityPin: Image           if needed --> uncomment import SwiftUI
    
    var userCoord: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
    }
}
