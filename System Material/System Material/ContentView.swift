//
//  ContentView.swift
//  System Material
//
//  Created by Yoon Ro on 2024-05-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    

    
    var body: some View {
        VStack {
            
            Spacer()
            Model3D(named: "visionpro", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .background(.ultraThinMaterial)
                    .frame(width:70, height: 6)
                    .padding()
                Text("Tim Cook")
                    .font(.title)
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))

        }.ignoresSafeArea()
            .background(
                Image("timcook")
                    .resizable()
                    .scaledToFit()
            )
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
