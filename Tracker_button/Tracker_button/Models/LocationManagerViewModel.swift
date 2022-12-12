//
//  LocationManagerViewModel.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 11/12/2022.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

class LocationManagerViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var status: CLAuthorizationStatus
//    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion() // create a @Published variable of type MKCoordinateRegion, this will be our Binding variable that will observe for changes in the user’s location

// create a var of type CLLocationManager, init, will set up and handle what we need in order to get the user’s coordinates.
    private let locationManager = CLLocationManager()
    
// override the init of the class. We will call our CLLocationManager variable and set the .delegate to self.
    override init() {
        status = locationManager.authorizationStatus
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // .desiredAccuracy - a lot of pre-made values
        locationManager.startUpdatingLocation()
    }


// This method updates our @Published var above - once we denied permission 'listening to change' in the View
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }
    
// Apple fce - Location Button to start updating location, once authorized we can begin to track the user - pop-up
    @objc func showNearByMe() {
        // self.locationManager.requestWhenInUseAuthorization() // CLLocationButton - ask for one-time permission on our behalf when the button is tapped
        self.locationManager.startUpdatingLocation()
    }

// In this fce - we will track the users location, we will set our MKCoordinateRegion.
    func locationManager(_ manager: CLLocationManager,
                            didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return } // access to the last location
//        self.location = location
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)) // already initialized above
    }
}


//Publishing changes from within view updates is not allowed, this will cause undefined behavior.
//Explanation: https://www.youtube.com/watch?v=3a7tuhVpoTQ

// CoreLocation is a bit tricky in SwiftUI compared to its UIKit comparison. We need to set a CLLocationManagerDelegate in order to have access to location updates in our app. This is ideally done by creating a custom class that will handle the CLLocationManagerDelegate.

// Since we added 'the CLLocationManagerDelegate' to our class above -> it will require the following function:
    // manager -> the object that you use to start & stop the delivery of location-related events to your app
    // locations -> the lat, long, and course information reported by the system
    

//    @Published var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340),
//        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//    )
