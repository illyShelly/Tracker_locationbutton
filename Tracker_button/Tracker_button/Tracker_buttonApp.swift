//
//  Tracker_buttonApp.swift
//  Tracker_button
//
//  Created by Ilona Sellenberkova on 11/12/2022.
//

import SwiftUI

@main
struct Tracker_buttonApp: App {
    @StateObject private var vm = LocationManagerViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
