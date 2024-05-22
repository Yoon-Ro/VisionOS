//
//  LocationsView.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    
//    @StateObject private var vm = LocationsViewModel()
    // by adding below line, we don't need @StateObejct
    @EnvironmentObject private var vm: LocationsViewModel
 

    var body: some View {
        


        ZStack {
            Map() {
                Marker("Your Location", coordinate: vm.mapRegion.center)
            }
            .mapStyle(.hybrid(elevation: .realistic))
            
            VStack(spacing: 0){
                header
                    .glassBackgroundEffect()
                    .padding(.top, 20)
                    .frame(depth: 70)
                Spacer()
            }
        }
    }
    
//        Map() {
//            // Map Content
//            ForEach(vm.locations) { location in
////                Marker(location.name, coordinate: location.coordinates)
//                Marker(coordinate: mapRegion.center) {
//                    Text(location.name)
//                }
//            }
//        }
//        .mapStyle(.hybrid(elevation: .realistic)) 
//        // Add map style if desired
//    }
    
}//Struct

#Preview {
    

    LocationsView()
        .environmentObject(LocationsViewModel())
}


extension LocationsView {
    private var header: some View {
        HStack(alignment: .center) { // Add this modifier to center the content
            
            // Overlay
            Image(systemName: "arrow.down")
                .font(.headline)
                .foregroundStyle(.primary)
//                .padding(.leading, 8)

            
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)



        }.padding()
    }
}
