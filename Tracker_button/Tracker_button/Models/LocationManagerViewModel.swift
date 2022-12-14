//
//  LocationManagerViewModel.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 11/12/2022.
//

import Foundation
import CoreLocation
import MapKit

class LocationManagerViewModel: NSObject, ObservableObject {
    @Published var status: CLAuthorizationStatus
    @Published var lastLocation: CLLocation?    // CLLocation vs CLLocationCoordinate2D
    @Published var walkingArr: [CLLocation]?
    
    @Published var region = MKCoordinateRegion( // instantiate with default location when permission denied
        center: CLLocationCoordinate2D(latitude: 51.505554, longitude: -0.075278), // US -> 38.8981, -77.0343
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    //var distanceFilter: CLLocationDistance = 20.0 // min distance to move horizontally
    let CLLocationDistanceMax: CLLocationDistance = 1.0 // A distance in meters from an existing location.
    
    // Will set up and handle what we need in order to get the user’s coordinates.
    private let locationManager = CLLocationManager() // Instantiate var of type CLLocationManager,
    
    // Override the init of the class. We will call our CLLocationManager variable and set the .delegate to self.
    override init() {
        status = locationManager.authorizationStatus // need to be initialized before super.init() class
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // a lot of pre-made values
        locationManager.distanceFilter = self.CLLocationDistanceMax
//          locationManager.startUpdatingLocation()     // The CLLocationButton handles permission now
    }
    
// Apple fce - Location Button to start updating location, once authorized we can begin to track the user - pop-up
    @objc func showNearByMe() {
//         self.locationManager.requestWhenInUseAuthorization() // CLButton - ask now for one-time permission on our behalf
        self.locationManager.startUpdatingLocation()
    }
    
    func checkLocationAuthorization() { // updates our @Published above -'listening to change' in the View
        // Handle each case of location permissions
        switch status {
            case .authorizedWhenInUse:
                // The best option - map display
//                self.locationManager.startUpdatingLocation()
                break
            case .denied:
                // We cannot pop-up another permission -> instruct user go to General Settings
                break
            case .notDetermined:
                // User haven't click anything yes/no
                self.locationManager.requestWhenInUseAuthorization()
                break
            case .restricted:
                // User cannot change status -> e.x.: Parental control
                break
            case .authorizedAlways:
                // get geo location even in the backround - users worried about privacy - not use if not necessary
                break
        @unknown default:
            print("Unknown authorization status")
        }
    }
    
}


extension LocationManagerViewModel: CLLocationManagerDelegate {
    
//    func requestPermission() {
//        locationManager.requestWhenInUseAuthorization() // no need for LocationButton anymore!!!
//    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("location manager authorization status changed")
        self.status = manager.authorizationStatus
    }
    
    // DidUpdateLocation -> is one of the Delegete event - > that's why locationManager needs to set delegate -> to self
    // In this fce - we will receive/track the users location as an 'array' & 'update' our Published proverty above
    // Tells the delegate that new location data is available.
    // We will set up our MKCoordinateRegion & Coordinates
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return } // access to the last location
            self.lastLocation = location
        self.walkingArr = locations
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error occured")
        print(error)
    }
    
    
}


//var distanceFilter: CLLocationDistance
//The minimum distance in meters the device must move horizontally before an update event is generated.
//let CLLocationDistanceMax: CLLocationDistance
//A constant indicating the maximum distance.

// create a @Published variable of type MKCoordinateRegion, this will be our Binding variable that will observe for changes in the user’s location

//Publishing changes from within view updates is not allowed, this will cause undefined behavior.
//Explanation: https://www.youtube.com/watch?v=3a7tuhVpoTQ

// CoreLocation is a bit tricky in SwiftUI compared to its UIKit comparison. We need to set a CLLocationManagerDelegate in order to have access to location updates in our app. This is ideally done by creating a custom class that will handle the CLLocationManagerDelegate.

// Since we added 'the CLLocationManagerDelegate' to our class above -> it will require the following function:
    // manager -> the object that you use to start & stop the delivery of location-related events to your app
    // locations -> the lat, long, and course information reported by the system

