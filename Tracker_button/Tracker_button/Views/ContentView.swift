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
    
    @State var showModal = false
    
    var body: some View {
        NavigationView {
            MapView()
                      .ignoresSafeArea(.all)
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(8.0)
                            .background(.pink)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
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
        .sheet(isPresented: $showModal){
            AddActivityModalView()
                .presentationDetents([.medium])
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManagerViewModel())
    }
}
