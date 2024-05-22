//
//  Location.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import Foundation
import MapKit

struct Location: Identifiable {
    // all the data for specific location
    
//    let id = UUID().uuidString
    // UUID will create a different id when there are two or more same locations
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D /* We have to import MapKit to use this*/
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        // add a logic to determine id
        // name = "Seoul", cityName = "is Cool, id = "Seoul is Cool"
        name + cityName
    }
}


