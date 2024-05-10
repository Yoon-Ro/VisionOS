//
//  ContentView.swift
//  SubmitTextField
//
//  Created by Yoon Ro on 2024-05-09.
//

import SwiftUI

struct ContentView: View {

    @State private var text: String = ""
    
    var body: some View {
        
        
        TextField("Placeholder...", text: $text)
            .submitLabel(.continue)
            .onSubmit {
                print("Hello, World")
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
