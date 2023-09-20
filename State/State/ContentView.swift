//
//  ContentView.swift
//  State
//
//  Created by Yoon Ro on 2023-09-15.
//

import SwiftUI

struct ContentView: View {

    @State var backgroundColor: Color = Color.green
    @State var myTitle : String = "My Title"
    @State var count: Int = 0

    var body: some View {
        NavigationStack {
            ZStack {
                //background
                backgroundColor
                    .ignoresSafeArea(.all).opacity(0.4)
                
                //foreground
                VStack(spacing: 20){
                    Text("\(myTitle)")
                        .font(.title)
                    Text("Count: \(count)")
                        .underline()
                    
                    HStack(spacing: 20){
                        Button("Button 1") {
                            backgroundColor = .red
                            myTitle = "Now it's red"
                            count += 1
                            print("Background is red")
                        }
                        Button("Button 2") {
                            backgroundColor = .blue
                            myTitle = "Now it's blue"
                            count -= 1
                            print("Background is blue")
                        }
                    
                    
                    
                    }
                    
                }
            }
            .navigationTitle(Text("State"))
            .glassBackgroundEffect()
            .background(.orange)
        }//Navigation Stack
    }
}

#Preview {
    ContentView()
}
