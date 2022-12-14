//
//  RoutePointVM.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 14/12/2022.
//

import Foundation

class RoutePointVM: ObservableObject, Identifiable {
    
    @Published var points: [RoutePoint] = []
     
}
