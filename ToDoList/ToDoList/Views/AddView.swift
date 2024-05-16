//
//  AddView.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-15.
//

import SwiftUI

struct AddView: View {
    
    
    @State var textFieldText: String
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .glassBackgroundEffect()
                .foregroundStyle(.white)
                
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                })
                .padding(.top, 40)
            }
            .padding(16)
        }
        .navigationTitle("Add an Item")
    }
}

#Preview {
    NavigationStack{
        AddView(textFieldText: "Type something here")
    }
}
