//
//  ContentView.swift
//  TextField
//
//  Created by Yoon Ro on 2024-01-11.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var textFieldText: String = ""
    @State private var dataArray: [String] = []
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Type something here...", text: $textFieldText)
  
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if textIsAppropriate(){
                        saveText()
                    }
                    }, label: {
                        Text("Button").frame(maxWidth: .infinity)
                    }).background(textIsAppropriate() ? Color.blue : Color.gray).clipShape(RoundedRectangle(cornerRadius: 25.0))                    .disabled(!textIsAppropriate())

                
                ForEach(dataArray, id: \.self) { data in Text(data)}
                
                Spacer()
            }
            .padding(.all, 20.0)
            .navigationTitle("TextField :(")
        }

    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        } 
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
    }
    
    }


#Preview(windowStyle: .automatic) {
    ContentView()
}
