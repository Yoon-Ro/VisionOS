//
//  StateApp.swift
//  State
//
//  Created by Yoon Ro on 2023-09-15.
//

import SwiftUI

@main
struct StateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
