//
//  ContentView.swift
//  DarkMode
//
//  Created by Yoon Ro on 2024-03-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
       NavigationView {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Hello, world!")
            }
           ScrollView{
               VStack(spacing: 20){
                   Text("This text is PRIMARY")
                       .foregroundStyle(.primary)
                   Text("This color is SECONDARY")
                       .foregroundStyle(.secondary)
                   Text("This color is ORANGE")
                       .foregroundStyle(.orange)
                   Text("This color is WHITE")
                       .foregroundStyle(.white)
                   Text("ADAPTIVE")
                       .foregroundStyle(Color("AdaptiveColor"))
                   Text("LOCALLY ADAPTIVE")
                       .foregroundStyle(colorScheme == .light ? .green : .yellow)
                   
               }
           }
           .navigationTitle("Adapting Dark Mode in visionOS?")
        }
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
