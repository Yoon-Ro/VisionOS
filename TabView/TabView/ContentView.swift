//
//  ContentView.swift
//  TabView
//
//  Created by Yoon Ro on 2024-02-28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        
//        TabView {
//            
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundStyle(.red)
//            
//            
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundStyle(.blue)
//            
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundStyle(.green)
//            
//        }
//        .frame(height:300)
//        .tabViewStyle(PageTabViewStyle())
        
                TabView(selection: $selectedTab){
        
                    HomeView(selectedTab: $selectedTab)
                        .tabItem {
                            Image.init(systemName: "house.fill")
                            Text("home")
                        }.tag(0)
        
                    Text("VIDEO TAB")
                        .tabItem {
                            Image.init(systemName: "video.fill")
                            Text("video")
                        }.tag(1)
        
                    Text("VIEW TAB")
                        .tabItem {
                            Image.init(systemName: "globe")
                            Text("view tab")
                        }.tag(2)
                }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            VStack {
                Text("HOME PAGE")
                    .padding()
                    .glassBackgroundEffect()
                    .font(.title)
                .foregroundStyle(.white)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to profile")
                }).tint(.blue)
            }
            

        }
    }
}
