//
//  BindingApp.swift
//  Binding
//
//  Created by Yoon Ro on 2023-09-16.
//

import SwiftUI

@main
struct BindingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
