//
//  TapGestureApp.swift
//  TapGesture
//
//  Created by Yoon Ro on 2024-03-15.
//

import SwiftUI

@main
struct TapGestureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
