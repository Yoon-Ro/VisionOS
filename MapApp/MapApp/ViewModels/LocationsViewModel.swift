//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import Foundation
import MapKit


class LocationsViewModel: ObservableObject {
    
    
    //All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
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
    
}
