//
//  ContentView.swift
//  ExtractedFunction
//
//  Created by Yoon Ro on 2023-09-15.
//

import SwiftUI

struct ContentView: View {
    
    @State
    var myBackground : Color = Color.clear
    @State var buttonBackground : Color = Color.yellow
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                myBackground
                
                contentLayer

            }
        }
    }
    

    var contentLayer : some View {
        VStack{
            Text("title").font(.largeTitle)
            Button(action: {
                buttonPressed()
                
            }, label: {
                Text("Button")
                
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding()
                    .padding(.horizontal, 10)
                
                
            })
            .buttonStyle(.plain)
            .background(buttonBackground)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            
           
            
        }
    }
    
    func buttonPressed() {
        myBackground = .blue
        buttonBackground = .white
    }
    
}


#Preview {
    ContentView()
}
