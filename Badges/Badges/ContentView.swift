//
//  ContentView.swift
//  Badges
//
//  Created by Yoon Ro on 2024-05-08.
//

import SwiftUI
import RealityKit
import RealityKitContent

//  List
//  TabView

struct ContentView: View {
    var body: some View {

        TabView{
            NavigationStack{
                List{
                    Text("Hello, World")
                        .badge("New Items!")
                    Text("Hello, World")
                    Text("Hello, World")
                    Text("Hello, World")

                }.padding()
            }
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }
                .badge(5)
            
            Color.red.opacity(0.1)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }.badge("Press Like")
            
            Color.orange.opacity(0.1)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
