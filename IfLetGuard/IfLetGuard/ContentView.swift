//
//  ContentView.swift
//  IfLetGuard
//
//  Created by Yoon Ro on 2024-03-12.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var displayText: String? = nil
    @State var currentUserID: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Text("Here we are practicing safe coding!")
                if let text = displayText{
                    Text(text)
                        .font(.title)
                        .padding()
                        .glassBackgroundEffect()
                        .frame(depth: 100)
                }
                
//                Text(displayText!)                      .font(.title)
//                    .padding()
//                    .glassBackgroundEffect()
//                    .frame(depth: 100)
                
                if isLoading{
                    ProgressView().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100).background()
                }

                Spacer()
            }
            
            
            
            .navigationTitle("IfLet & Guard")
            .onAppear{
                loadData2()
            }
        }

    }
    
    func loadData() {
        
        if let userID = currentUserID{
            
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                displayText = "This is the new data \(userID)"
            }
            isLoading = false
        } else{
            displayText = "Sign in to continue"
        }
        
        

    }
    
    func loadData2() {
        guard let userID = currentUserID else {
            displayText = "Sign in to continue"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            displayText = "Welcome back, \(userID)"
        }
        isLoading = false
 
    }
    
}



#Preview(windowStyle: .automatic) {
    ContentView()
}
