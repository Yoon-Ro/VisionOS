//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by Yoon Ro on 2024-05-23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.circle")
                .resizable()
                .scaledToFit()
                .frame(width:30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(2)
                .background(accentColor)
                .clipShape(Circle())
        }

    }
}

#Preview {
    LocationMapAnnotationView()
}
