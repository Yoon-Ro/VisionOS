//
//  ContentView.swift
//  AppStorage
//
//  Created by Yoon Ro on 2024-04-30.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {

        VStack(spacing: 20) {
            Text(currentUserName ?? "Add name here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            
            Button("SAVE"){
                let name: String = "Emily"
                currentUserName = name
            }
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
