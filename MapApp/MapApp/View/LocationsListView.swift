//
//  LocationsListView.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-21.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel

    var body: some View {
        VStack(alignment: .leading) { // Added VStack for optional maxHeight constraint
            List {
                ForEach(vm.locations) { location in
                    Button {
                        vm.showNextLocation(location: location)
                    } label: {
                        listRowView(location: location)
                            .listRowSeparator(.hidden)
                    }
                }
                .padding()
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.automatic)
            .frame(width: 500) // Keep fixed width if needed
            .frame(maxHeight: 400) // Optional maximum height
        }
    }
  
    // ... (rest of the code remains the same)
}


#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            // imageName calls the first imageNames from vm
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
        }
    }
}
