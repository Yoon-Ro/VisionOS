//
//  ContentView.swift
//  ContextMenu
//
//  Created by Yoon Ro on 2024-01-11.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var Counter: Int = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0){
    Image(systemName: "house.fill")
                .font(.title)
            Text("\(Counter) to Vision Pro")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }.frame(depth: 20.0)
        .padding(.all, 20.0)
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {Counter += 1}, label: {
                Label("Like", systemImage: "heart.fill")
            })
            Button(action: {print("HELLO")}, label: {
                Label("Share", systemImage: "square.and.arrow.up")
            })
            Button(action: {print("HELLO")}, label: {
                Label("Bookmark", systemImage: "bookmark.fill")
            })
        })
        )
        Spacer()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
