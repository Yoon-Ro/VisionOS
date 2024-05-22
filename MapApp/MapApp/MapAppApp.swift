//
//  MapAppApp.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    //Before body works, we access to the LocationViewModel first
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
            //anything inside the LodationsView will have an access to vm by using .environmentObject
        }
    }
}
