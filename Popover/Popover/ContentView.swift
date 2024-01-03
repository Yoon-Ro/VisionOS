//
//  ContentView.swift
//  Popover
//
//  Created by Yoon Ro on 2024-01-01.
//

import SwiftUI

struct ContentView: View {
    @State var showNewScreen: Bool = false

    var body: some View {
    
        
        ZStack{
            
            VStack{
                Button("BUTTON"){
                    print("HEELO")
                    withAnimation(Animation.default){
                        showNewScreen.toggle()
                    }
                }.font(.largeTitle)
            }
        }

        
        if showNewScreen {
            NewScreen(NewScreen: $showNewScreen)
                .padding(.top,100)
            .transition(AnyTransition.slide.animation(.easeInOut(duration: 1)))            }
        
    }
}

struct NewScreen: View {
    @Binding var NewScreen: Bool
    var body: some View {
        ZStack{
            Color.red.opacity(0.1)
            
            Button(action: {NewScreen.toggle()}, label: {
                Image(systemName: "xmark")
            })
        }
   
    }
}

#Preview {
   ContentView()
}
