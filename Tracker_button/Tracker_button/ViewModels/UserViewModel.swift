//
//  UserViewModel.swift
//  Tracker_button
//
//  Created by Adriana Salomone on 14/12/22.
//

import Foundation
import MapKit

class UserViewModel: ObservableObject {
    
    //declaring a list of posts conforming to the array UserModel (Activities to show on map). It is observable because the view is looking at this model to create content to show and the following is published because it needs to be seen/shared.
 
   @Published var listOfUsers: [User] = [
    
    User(userLat: 40.838396, userLon: 14.304876544159718, userActivity: "figure.run", showOnMap: false),
         
    User(userLat: 40.837554 , userLon: 14.304033, userActivity: "cart", showOnMap: false),
         
    User(userLat: 40.83631, userLon: 14.306761, userActivity: "pawprint.fill", showOnMap: false),
              
    User(userLat: 40.83538, userLon: 14.3054, userActivity: "party.popper", showOnMap: false),
    
    User(userLat: 40.836602, userLon: 14.307459, userActivity: "bicycle", showOnMap: false),
    
    User(userLat: 40.83751, userLon: 14.308281, userActivity: "film.fill", showOnMap: false),
    
    User(userLat: 40.837312, userLon: 14.306317, userActivity: "bubble.left.and.bubble.right.fill", showOnMap: false),
    
    User(userLat: 40.836938, userLon: 14.308674, userActivity: "building.columns.fill", showOnMap: false)]
    
}
