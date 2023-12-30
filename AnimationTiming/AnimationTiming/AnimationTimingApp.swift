//
//  AnimationTimingApp.swift
//  AnimationTiming
//
//  Created by Yoon Ro on 2023-12-29.
//

import SwiftUI

@main
struct AnimationTimingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
