//
//  ConditionalApp.swift
//  Conditional
//
//  Created by Yoon Ro on 2023-09-16.
//

import SwiftUI

@main
struct ConditionalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
