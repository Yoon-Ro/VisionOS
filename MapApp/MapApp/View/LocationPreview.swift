//
//  LocationPreview.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-23.
//

import SwiftUI

struct LocationPreview: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(alignment: .center) {
                learnMoreButton
                nextButton
            }
        }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.ultraThickMaterial)
                    .offset(y: 65)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .clipped()
            
    }
}

#Preview {
    LocationPreview(location: LocationsDataService.locations.first!).environmentObject(LocationsViewModel())
}

extension LocationPreview {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            }
        }
        .padding(6)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {

        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
        }
        
    }
    
    private var nextButton: some View {

        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
        }
        
    }
}
