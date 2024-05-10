//
//  ContentView.swift
//  NavigationStack
//
//  Created by Yoon Ro on 2024-05-09.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    
    @State private var stackPath: [String] = []
    
    var body: some View {

        
        NavigationStack(path: $stackPath) {
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Button("Super Segue") {
                        stackPath.append(contentsOf: [
                            "Coconut", "Melon", "Mango"
                        ])
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit){
                            Text("\(fruit)")
                        }
                    }
                    ForEach(0..<10) { x in
                        
                        NavigationLink(value: x){
                            Text("Click me: \(x)")
                        }
                    }
                        
                        //                        NavigationLink(destination: {
                        //                            MySecondScreen(value: x)
                        //                        }, label: {
                        //                            Text("Click me")
                        //                        })
                        
                        .navigationDestination(for: String.self) { value in
                            Text("\(value)")
                        }
                        
                        
                        .navigationDestination(for: Int.self) { value in
                            MySecondScreen(value: value)
                        }
                        
                        .navigationTitle("Hello, World")
                        
                    }
                }
            }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value)")
    }
    
    var body: some View {
        
        Text("Screen \(value)")
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
