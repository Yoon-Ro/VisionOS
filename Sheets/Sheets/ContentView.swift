//
//  ContentView.swift
//  Sheets
//
//  Created by Yoon Ro on 2024-01-01.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    

    @State var showSheet: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("Button")
                })
                .fullScreenCover(isPresented: $showSheet, content: {
                    SecondScreen()
                })
//                .sheet(isPresented: $showSheet, content: {
//                    SecondScreen()
//                })
            }
        }
    }
}


struct SecondScreen: View {
    
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack (){
            HStack(){
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .padding()
                        .buttonStyle(.plain)
                }).padding()
                Spacer()
            }
Spacer()
            Text("Happy New Year").font(.extraLargeTitle)
                .frame(depth: 200)
            Spacer()
            
        }
    }
}


#Preview {
        ContentView()
//SecondScreen()
}

