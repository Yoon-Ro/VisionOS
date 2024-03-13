//
//  ContentView.swift
//  OnAppear
//
//  Created by Yoon Ro on 2024-03-12.
//

import SwiftUI


struct ContentView: View {
    
    @State var myText: String = "Starting Text"
    @State var count: Int = 0
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                Text(myText)
                LazyVStack{
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height:200)
                            .padding()
                            .onAppear{
                                count += 1
                            }

                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5)
                { myText = "This is the new text!"}
            })
            
            .onDisappear(perform: {
                myText = "Ending Text."
            })
            
             
            .navigationTitle("onAppear Modifier \(count)")
            
        } // END: NAV
        
        
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
