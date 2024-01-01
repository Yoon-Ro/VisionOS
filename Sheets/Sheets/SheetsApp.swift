//
//  SheetsApp.swift
//  Sheets
//
//  Created by Yoon Ro on 2024-01-01.
//

import SwiftUI

@main
struct SheetsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
