//
//  ContentView.swift
//  TextSelection
//
//  Created by Yoon Ro on 2024-05-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
                .textSelection(.enabled)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
