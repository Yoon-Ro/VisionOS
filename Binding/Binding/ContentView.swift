//
//  ContentView.swift
//  Binding
//
//  Created by Yoon Ro on 2023-09-16.
//

import SwiftUI


struct ContentView: View {
    
    @State var backgroundColor: Color = Color.clear
    @State var title: String = "Title"

    var body: some View {
        NavigationStack{
            ZStack{
                backgroundColor
                
                VStack {
                    Text(title)
                    ButtonView(backgroundColor: $backgroundColor, title: $title)
                }
            }
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .red
    @Binding var title: String
    
    var body: some View {
        Button(action: {
            backgroundColor = .blue
            title = "New title"
            buttonColor = .green
        }, label: {
            Text("button")
                .foregroundStyle(.white)
                .padding()
                .background(buttonColor)
        }).buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
