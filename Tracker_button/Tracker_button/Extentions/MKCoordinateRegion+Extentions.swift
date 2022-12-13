//
//  MKCoordinateRegion+Extentions.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 12/12/2022.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.8981, longitude: -77.0343),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}
