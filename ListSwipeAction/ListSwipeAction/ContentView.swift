//
//  ContentView.swift
//  ListSwipeAction
//
//  Created by Yoon Ro on 2024-05-08.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        VStack {
            
            
            
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                        .swipeActions(
                            edge: .trailing,
                            allowsFullSwipe: true
                        ){
                            Button("Archive"){
                                
                            }.tint(.green)
                            
                            Button("Save"){
                                
                            }.tint(.blue)
                            
                            Button("Junk"){
                                
                            }.tint(.red)
                        }
                        .swipeActions(
                            edge: .leading,
                        allowsFullSwipe: true){
                            Button("Share"){
                                
                            }.tint(.yellow)
                    
                }
//                .onDelete(perform: delete)
            }
            

        }
        

     
    }
    
//    func delete(indexSeet: IndexSet) {
        
    }
    
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
