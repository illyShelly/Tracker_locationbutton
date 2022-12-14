//
//  UserViewModel.swift
//  Tracker_button
//
//  Created by Adriana Salomone on 14/12/22.
//

import Foundation


class UserViewModel: ObservableObject {
    
    //declaring a list of posts conforming to the array UserModel (Activities to show on map). It is observable because the view is looking at this model to create content to show and the following is published because it needs to be seen/shared.
 
   @Published var listOfUsers: [User] = [
    
    User(lat: 40.838396, lon: 14.304876544159718, activity: "figure.run", showOnMap: false),
         
    User(lat: 40.837554 , lon: 14.304033, activity: "cart", showOnMap: false),
         
    User(lat: 40.83631, lon: 14.306761, activity: "pawprint.fill", showOnMap: false),
              
    User(lat: 40.83538, lon: 14.3054, activity: "party.popper", showOnMap: false),
    
    User(lat: 40.836602, lon: 14.307459, activity: "bicycle", showOnMap: false),
    
    User(lat: 40.83751, lon: 14.308281, activity: "film.fill", showOnMap: false),
    
    User(lat: 40.837312, lon: 14.306317, activity: "bubble.left.and.bubble.right.fill", showOnMap: false),
    
    User(lat: 40.836938, lon: 14.308674, activity: "building.columns.fill", showOnMap: false)]
    
}

//this enum is to iterate through activities, to filter them on the map.

enum Activity: String, CaseIterable {
    
    case fitness = "figure.run"
    case shopping = "cart"
    case walkDog = "pawprint.fill"
    case party = "party.popper"
    case cycling = "bicycle"
    case movie = "film.fill"
    case talk = "bubble.left.and.bubble.right.fill"
    case culture = "building.columns.fill"
}
