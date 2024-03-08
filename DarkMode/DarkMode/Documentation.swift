//
//  ContentView.swift
//  DarkMode
//
//  Created by Yoon Ro on 2024-03-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Documentation: View {
    
    // MARK: PROPERTIRES
    
    // Working copy - things to do:
    // 1) List 1
    // 2) List 2
    // 3) List 3
    // or we can write in other way
    
    /*
     Working copy - things to do:
     1. list 1
     2. list 2
     3. list 3
     */
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas", "Kiwis"
    ]
    @State var showAlert: Bool = false
    
    // MARK: BODY
    var body: some View {
       NavigationView { // START: NAV
            VStack { //LEFT VIEW

                Text("Hello, world!")
            }
            .navigationTitle("swiftfuil Thinking")
           
           ZStack { //RIGHT VIEW
               Color.red.ignoresSafeArea()
               foregroundLayer
               
               
               .navigationTitle("Documentation")
               .toolbar{
                   ToolbarItem(placement: .bottomOrnament){
                       Button("Add"){showAlert.toggle()}
                   }
               }
               .alert(isPresented: $showAlert, content: {
                   getAlert(text: "this is the alert!")
           })
           }
            
            }
    }
    
    private var foregroundLayer: some View{
        ScrollView{
            Text("Type of fruits")
            ForEach(data, id: \.self) { name in
                 Text(name)
                    .font(.headline)
            }
        }
    }
    // MARK: FUNCTION
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

#Preview(windowStyle: .plain) {
    Documentation()
}
