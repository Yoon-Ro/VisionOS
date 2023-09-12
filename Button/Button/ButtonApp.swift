//
//  ButtonApp.swift
//  Button
//
//  Created by Yoon Ro on 2023-09-11.
//

import SwiftUI

@main
struct ButtonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
