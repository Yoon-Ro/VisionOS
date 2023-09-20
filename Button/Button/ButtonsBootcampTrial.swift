//
//  ButtonsBootcampTrial.swift
//  Button
//
//  Created by Yoon Ro on 2023-09-11.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent


struct ButtonsBootcampTrial: View {
    
    @State var title: String = "This is a button"
    
    private let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/teapot/teapot.usdz")!

    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black.opacity(0.1)
                
                VStack{
                    Text(title)
//                    Button("Text"){
//                        self.title = "Default button is pressed"
//                    }
//                    .tint(.blue)
//                    
//                    Button(action: {
//                        self.title = "Custom button is pressed"
//                    }, label: {
//                        Text("Button")
//                            .font(.title)
//                    })
//                    .buttonStyle(.plain)
//                    .padding()
//                    .padding(.horizontal, 20)
//                    .background(                                    Color.blue
//                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .continuous))
//                        .shadow(radius: 10))
//                    .foregroundStyle(.white)
//                    
//                    Button(action: {
//                        self.title = "Live button is pressed"
//                    }, label:{
//                        Circle()
//                            .frame(width: 50, height: 50)
//                            .overlay(
//                                Image(systemName: "heart.fill")
//                                    .font(.title)
//                                    .foregroundStyle(.red))
//                            
//                    })
//                    .buttonStyle(.plain)
//                    
//                    Button(action: {
//                        self.title = "Stroke button is pressed"
//                    }, label: {
//                        Text("Border")
//                            .font(.caption2)
//                            .fontWeight(.heavy)
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 16)
//                            .background(
//                            Capsule()
//                                .stroke(Color.white, lineWidth: 2.0))
//                    })
//                    .buttonStyle(.plain)
//                    .foregroundStyle(.white)
                    
                    Button(action: {}, label: {
                        Model3D(url: url) { model in
                            model
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:20, height:20)
                                       } placeholder: {
                                           ProgressView()
                                        }
                    })
                    .tint(.blue)
                    
 
        
                    
                }
            }
            .glassBackgroundEffect()
            .padding()
            .frame(depth: 40)
            
            
                .navigationTitle(Text("Let's try"))
        }
    }
}


#Preview {
    ButtonsBootcampTrial()
}
