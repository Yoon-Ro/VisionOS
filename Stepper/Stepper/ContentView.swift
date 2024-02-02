//
//  ContentView.swift
//  Stepper
//
//  Created by Yoon Ro on 2024-02-01.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var stepperValue: Int = 10
    @State var add: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue).padding(20)
            
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + CGFloat(add), height: 100)
                .frame(depth: 100)
            
            Stepper("Stepper 2") {
                incrementWidth(amount: 10)
            } onDecrement: {
                incrementWidth(amount: -10)
            }.padding(20)

        }
    }
    
    func incrementWidth(amount: CGFloat){
        withAnimation(.easeInOut){
            add += Int(amount)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
