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
                    Marker("\(vm.mapLocation.name)", coordinate: vm.mapRegion.center) }
                      .mapStyle(.hybrid(elevation:.realistic))
            .shadow(radius: 20)
 
//                mapLayer
                
                
            VStack(spacing: 0){
                header
                    .glassBackgroundEffect()
                    .padding(.top, 20)
                    .frame(depth: 70)


                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreview(location: location)
                                .padding()
                                .frame(width: 400)
                                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                        }
     
                            
                    }
                }
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
        
        VStack {
            Button(action: vm.toggleLocationsList, label: {
                HStack(alignment: .center) { // Add this modifier to center the content
                    
                    // Overlay
                    Image(systemName: vm.showLocationList ? "arrow.up" : "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)

                    
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                        .font(.title)
                        .foregroundStyle(.white)                     .fontWeight(.bold)
                        .animation(.none, value: vm.locations)
                    
         



                }.padding()
            }
            )
                
            
            
            if vm.showLocationList {
                LocationsListView()
            }
         
        }
    }
    
    private var mapLayer: some View {
        Map {
            ForEach(vm.locations) { location in
                Annotation(location.name, coordinate: vm.mapRegion.center) { // Use Annotation directly
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
        .mapStyle(.standard(elevation: .realistic)) // Example style, adjust as needed

    }

    
    
    
    
}//EXTENSION
