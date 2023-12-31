//
//  TransitionApp.swift
//  Transition
//
//  Created by Yoon Ro on 2023-12-30.
//

import SwiftUI

@main
struct TransitionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
