//
//  ContentView.swift
//  TextEditor
//
//  Created by Yoon Ro on 2024-01-15.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
    
        

        
        NavigationStack{
            VStack{
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundStyle(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .hoverEffect().frame(depth: 100)

                Button(action: {
                    print("clicked")
                    savedText = textEditorText
                }, label: {
                    Text("Button".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth:. infinity)
                })
                Spacer()
                Text(savedText).id(UUID()).font(.title)
                Spacer()
            }
            .padding()
            .background()
            .navigationTitle(Text("If you read this, press like button"))
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
