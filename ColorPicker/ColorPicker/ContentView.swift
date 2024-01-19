//
//  ContentView.swift
//  ColorPicker
//
//  Created by Yoon Ro on 2024-01-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundColor: Color = .clear
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                backgroundColor
                    .ignoresSafeArea(.all)
                
                ColorPicker("Select a color", 
                            selection: $backgroundColor,
                            supportsOpacity: true)
                .padding()
                .glassBackgroundEffect(displayMode: .always)
                .foregroundStyle(.green)
                .font(.title)
                .frame(depth: 30)
                .padding(50)
                .frame(width:400)

                    
                
                
                
            }  .ignoresSafeArea(.all)
                Spacer()
            Text("press like if you are reading this").opacity(0.2).padding(.bottom, 20)
            .navigationTitle("colorPicker()")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
