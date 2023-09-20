//
//  ContentView.swift
//  ExtractSubview
//
//  Created by Yoon Ro on 2023-09-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(Color.orange)
            
            ExtractedView()


        }
        .glassBackgroundEffect().padding()
    }
    
    
}

#Preview {
    ContentView()
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
    }
}

struct ExtractedView: View {
    var body: some View {
        HStack(spacing: 10){
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Bananas", count: 1, color: .yellow)
            MyItem(title: "Kiwi", count: 1, color: .green)
            MyItem(title: "blueberry", count: 1, color: .blue)
        }
    }
}
