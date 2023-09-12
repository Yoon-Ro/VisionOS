//
//  ButtonsBootcamp.swift
//  Button
//
//  Created by Yoon Ro on 2023-09-11.
//

import Foundation
import SwiftUI

struct ButtonsBootcamp : View {
    
//    let title: String = "This is my title"
    @State var title : String = "This is my title"
    
    var body: some View{
        NavigationStack{
            VStack{
                Text(title)
                
                Button("Button Title"){
                    self.title = "Default button is pressed"
                }
                .tint(Color.blue)
                
//                .background(.blue)
//                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
                
//                .foregroundStyle(.blue)
                
                Button(action: {
                    self.title = "Custom is pressed"
                }, label: {
                    Text("button")
                        .font(.headline)
                        .fontWeight(.bold)
                })
                .buttonStyle(.plain)
                .padding()
                .padding(.horizontal, 20)
                
                                .background(
                                    Color.blue
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .continuous))
                                        .shadow(radius: 10))
                                .foregroundStyle(.white)

                
                Button(action: {
                    self.title = "Thanks for the like"
                }, label: {
                    Circle()
                        .frame(width: 50, height: 50)
                        .frame(depth: 20)
                        .shadow(radius: 10)
                        .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.blue))
                })
                .buttonStyle(.plain)
                
                
                Button(action: {
                    self.title = "Stroke pill style"
                }, label: {
                    Text("Finish")
                        .underline()
                        .padding()
                        .padding(.horizontal, 20)
                        .background(
                        Capsule()
                            .stroke())
                        
                })
                .buttonStyle(.plain)
            

                
                
            }//VStack
          
           
            
  
            
            Spacer()
            
            
            .navigationTitle(Text("Buttons"))
        }
      
    }
}

#Preview {
    ButtonsBootcamp()
}
