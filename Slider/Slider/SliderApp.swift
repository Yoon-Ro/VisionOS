//
//  SliderApp.swift
//  Slider
//
//  Created by Yoon Ro on 2024-02-28.
//

import SwiftUI

@main
struct SliderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: 400, maxWidth: 480,
                    minHeight: 400, maxHeight: 700
                )
        }.defaultSize(width: 400, height: 300)
    }
}
