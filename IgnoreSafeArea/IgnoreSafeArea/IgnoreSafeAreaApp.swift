//
//  IgnoreSafeAreaApp.swift
//  IgnoreSafeArea
//
//  Created by Yoon Ro on 2023-09-11.
//

import SwiftUI

@main
struct IgnoreSafeAreaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
