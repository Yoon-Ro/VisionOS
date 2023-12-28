//
//  TernaryApp.swift
//  Ternary
//
//  Created by Yoon Ro on 2023-11-06.
//

import SwiftUI

@main
struct TernaryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
