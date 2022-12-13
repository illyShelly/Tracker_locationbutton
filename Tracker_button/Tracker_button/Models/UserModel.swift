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
    let userLat: Double
    let userLon: Double
    
    var userActivity: String
    // var userActivityPin: Image           if needed --> uncomment import SwiftUI
    
    var userCoord: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.userLat, longitude: self.userLon)
    }
}
