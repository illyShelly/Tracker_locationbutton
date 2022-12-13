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
        NavigationView {
            MapView()
                      .ignoresSafeArea(.all)
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // add user with ....
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.red)
                            .padding(5.0)
                            .background(Color.white)
                                
                    })
                }
                ToolbarItem(placement: .bottomBar) {
                // Show LocationButton to get its one-time permision of location confirmation - then it's done
                    if (vm.lastLocation == nil) {
                        LocationButton(.currentLocation) {
                            // call the fce defined in vm
                            vm.showNearByMe()
                        }.foregroundColor(.white)
                            .cornerRadius(50)
                            .labelStyle(.titleAndIcon)
                            .symbolVariant(.fill)
                            .tint(.pink)
                            .padding(.top, 10)
                    }
                }
            }// toolbar
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManagerViewModel())
    }
}
