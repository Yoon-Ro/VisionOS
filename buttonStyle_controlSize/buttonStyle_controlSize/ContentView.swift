//
//  ContentView.swift
//  buttonStyle_controlSize
//
//  Created by Yoon Ro on 2024-05-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

//            
//            Button("Button Title"){
//                print("is it working?")
//            }
//            .frame(height: 55)
//            .frame(maxWidth: .infinity)
//            .buttonStyle(AccessoryBarButtonStyle())
            

            Button{
                
            } label: {
                Text("Button Title")

            }
            .buttonStyle(PlainButtonStyle())
            .controlSize(.extraLarge)
                .padding()

            
            Button("Button Title"){
                print("is it working?")
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(DefaultButtonStyle())
            .controlSize(.large)
            
            Button("Button Title"){
                print("is it working?")
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(BorderlessButtonStyle())
            .controlSize(.extraLarge)

            
            
            Button("Button Title"){
                print("is it working?")
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(BorderedProminentButtonStyle())
            .controlSize(.small)
            
            Button("Button Title"){
                print("is it working?")
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            .controlSize(.mini)
            
            Button{
                
            } label: {
                Text("Button Title")
                    .textSelection(.enabled)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }            .controlSize(.extraLarge)
                .padding()

   
            
  
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
