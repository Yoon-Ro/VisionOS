//
//  ContentView.swift
//  NavigationView
//
//  Created by Yoon Ro on 2024-01-03.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            ScrollView{
                
                NavigationLink("Hello, Again") {
   MyOtherScreen()
                }.tint(.green)
                Text("Hello, World")
                Text("Hello, World")
                Text("Hello, World")
                Text("Hello, World")
                Rectangle() .frame(maxWidth: .infinity).frame(height: 700).foregroundStyle(.background)

            }
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: 
                        .topBarLeading){
                            HStack (spacing: 10){
                                Image(systemName: "person.fill")
                                Text("Home").font(.largeTitle)
                                    


                            }
                    Image(systemName: "person.fill")
                }
                
                ToolbarItem(placement: .bottomOrnament){
                    HStack{
                        HStack{
                            Text("Bottom Ornanment")
                            Image(systemName: "gear")
                        }               .padding().background(.blue).clipShape(RoundedRectangle(cornerRadius: 25.0))
             
      
                        NavigationLink("navigate"){
                            ZStack{
                                Model3D(named: "Scene", bundle: realityKitContentBundle).padding(.bottom, 200)
                            }
                        }.tint(.blue)
                        //tint should be working in button but it's not working in ornament position.
                    }
 
                }
            }
            



        
        }          

    }
}

struct MyOtherScreen: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack{
//            HStack{
//                Button("CUTOM BACK BUTTON"){
//                    dismiss()}.padding()
//                
//                Spacer()
//            }

            List{
                NavigationLink("Don't click"){
                    Text("I said don't click").font(.title)
                }.font(.title)
            }
            
            ZStack{
                Model3D(named: "Scene", bundle: realityKitContentBundle).padding(.bottom, 200)
            }
           Spacer()
//                .navigationTitle("Second")
//                .toolbar(.hidden)
        }

    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
