//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel

    
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(radius: 10)
                    
                
                HStack {
                    VStack(alignment: .leading, spacing: 16){
                        titleSection
                        Divider()
                        descriptionSection
                        Divider()

                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
//                    mapLayer
                }
 
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)  .environmentObject(LocationsViewModel())
}


extension LocationDetailView {
    
    private var imageSection: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(location.imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .clipped()
                }
            }
            .frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(height: 500) // Set the same height here to match the TabView height
    }
    
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
            
            if let url = URL(string: location.link
            ) {
                Link("Read more", destination: url)
            }
        }
    }
    
    
    private var mapLayer: some View {
        GeometryReader { geometry in
            
            Map() {
                Marker("\(vm.mapLocation.name)", coordinate: vm.mapRegion.center) }
            .aspectRatio(1, contentMode: .fill)
            .scaledToFit()
            .frame(width: geometry.size.width)
            .frame(width: .infinity, height: 500)
            .mapStyle(.standard)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25   , height: 25)))
            .allowsHitTesting(false)
        }
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.primary)
        }.padding()
    }
}
