//
//  ContentView.swift
//  MagnificationGesture
//
//  Created by Yoon Ro on 2024-05-27.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Circle().frame(width:35, height: 35)
                Text("Yoon_ro_")
                Spacer()
                Image(systemName: "ellipsis")
            }.padding()
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentAmount = value.magnification - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
                .hoverEffect(.lift)
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
