//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
    
    
    //All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    // sho list of locations
    @Published var showLocationList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {

            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        

    }
    
  func toggleLocationsList() {
      withAnimation(.easeInOut){
          showLocationList.toggle()
      }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location //Update the mapLocation
            showLocationList = false //it toggles to close showLocationList
        }
    }
    
    func nextButtonPressed() {
        
        //Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in lcoations array! SHould never happen.")
            return
        }
        
        // Chec if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
    
}
