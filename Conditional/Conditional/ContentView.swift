//
//  ContentView.swift
//  Conditional
//
//  Created by Yoon Ro on 2023-09-16.
//

import SwiftUI

struct ContentView: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
         
            Button("Circle Button is \(showCircle.description)"){
                showCircle.toggle()
            }
            
            Button("Rectangle Button is \(showRectangle.description)"){
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle().frame(width: 100, height: 100)
            }
            
            if showRectangle{
                Rectangle().frame(width: 100, height: 100 )
            }
            
            
            
            if showCircle || showRectangle {
                Rectangle().foregroundStyle(.red).frame(width: 100, height: 100)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
