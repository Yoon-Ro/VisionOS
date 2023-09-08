//
//  LazyGridItemsApp.swift
//  LazyGridItems
//
//  Created by Yoon Ro on 2023-09-07.
//

import SwiftUI

@main
struct LazyGridItemsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
