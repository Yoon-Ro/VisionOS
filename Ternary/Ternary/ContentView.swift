//
//  ContentView.swift
//  Ternary
//
//  Created by Yoon Ro on 2023-11-06.
//

import SwiftUI
import RealityKit


struct ContentView: View {

    @State var isStartingState: Bool = false

    var body: some View {
        NavigationStack{
            VStack{

                
//                if isStartingState {
//                    RoundedRectangle(cornerRadius: 25.0)
//                        .fill(Color.red)
//                        .frame(width: 200, height: 100)
//                } else {
//                    RoundedRectangle(cornerRadius: 25.0)
//                        .fill(Color.blue)
//                        .frame(width: 200, height: 100)
//                }
                
                Text(isStartingState ? "Starting State" : "Ending State")
             
                RoundedRectangle(cornerRadius: isStartingState ? 25 : 60)
                    .fill(isStartingState ? Color.red : Color.blue)
                        .frame(
                            width: isStartingState ? 200 : 180,
                            height: isStartingState ? 200 : 180)
                
               
                
                Button("Button: \(isStartingState.description)"){
                    isStartingState.toggle()
                     
                }//Button
                
                
                Spacer()
            }//VSTACK
            .padding()
        }
 
    }
}

#Preview {
    ContentView()
}
