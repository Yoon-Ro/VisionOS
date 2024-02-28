//
//  ContentView.swift
//  Slider
//
//  Created by Yoon Ro on 2024-02-28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var sliderValue: Double = 5
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Rating:")
//            Text("\(sliderValue)").font(.title)
            Text(
                String(format: "%.0f", sliderValue)
            ).foregroundColor(color)
                .font(.title)
//            Slider(value: $sliderValue, in: 0...20, step: 1.0)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                    
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"), label: {Text("Title")})
            
        }.padding(.horizontal)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
