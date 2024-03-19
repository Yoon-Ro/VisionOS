//
//  ContentView.swift
//  TapGesture
//
//  Created by Yoon Ro on 2024-03-15.
//

import SwiftUI


struct ContentView: View {
    
    @State var isSelected: Bool = false
    
var body: some View {
    VStack (spacing: 40){
        RoundedRectangle(cornerRadius: 25.0)
            .frame(height: 200)
            .padding(.horizontal)
            .foregroundStyle(isSelected ? Color.red : Color.blue)
        
        Button(action: {
            isSelected.toggle()
        }, label: {
            Text("Button")
                .padding()
                .padding(.horizontal, 20)
                .background(
                Capsule()
                    .stroke())
                
        })
        .buttonStyle(.plain)
        
        Text("Tap Gesture")
            .padding()
            .padding(.horizontal, 20)
            .background(
            Capsule()
                .stroke())
//            .onTapGesture {
//                isSelected.toggle()
//            }
            .onTapGesture(count: 2, perform: {
                isSelected.toggle()
            })
    }
        
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
