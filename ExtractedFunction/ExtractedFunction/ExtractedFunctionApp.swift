//
//  ExtractedFunctionApp.swift
//  ExtractedFunction
//
//  Created by Yoon Ro on 2023-09-15.
//

import SwiftUI

@main
struct ExtractedFunctionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
