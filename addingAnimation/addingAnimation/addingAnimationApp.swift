//
//  addingAnimationApp.swift
//  addingAnimation
//
//  Created by Yoon Ro on 2023-11-28.
//

import SwiftUI

@main
struct addingAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
