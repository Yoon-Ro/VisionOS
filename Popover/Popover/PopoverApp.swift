//
//  PopoverApp.swift
//  Popover
//
//  Created by Yoon Ro on 2024-01-01.
//

import SwiftUI

@main
struct PopoverApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
