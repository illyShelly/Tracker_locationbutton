//
//  ContentView.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 11/12/2022.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct ContentView: View {
    @EnvironmentObject private var vm: LocationManagerViewModel

    var body: some View {
        VStack {
            MapView()
//                .ignoresSafeArea(.all)
            
            // Core Location Button
            VStack {
                LocationButton(.currentLocation) {
                    // call the fce defined in vm
                    vm.showNearByMe()
                }   .foregroundColor(.white)
                    .cornerRadius(50)
                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .tint(.pink)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                Text("Permission needed to locate you.")
                    .foregroundColor(.gray)
                    .font(.callout)
            }
          
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
