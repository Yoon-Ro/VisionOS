//
//  ContentView.swift
//  Actionsheet
//
//  Created by Yoon Ro on 2024-01-08.
//

import SwiftUI

struct ContentView: View {
    @State var showingConfirmation: Bool = false
    @State var backgroundColor = Color.white
    
    var body: some View {
        
        VStack{
            HStack{
                Circle().frame(width: 30, height: 30)
                Text("@Yoon Ro | VisionOS")
                Spacer()
                Image(systemName: "ellipsis")
                    .onTapGesture {
                        showingConfirmation = true
                    }
                    .confirmationDialog("Change Background", isPresented: $showingConfirmation){
                        Button("Red"){ backgroundColor = .red}
                        Button("Blue"){ backgroundColor = .blue}
                        Button("Yellow"){ backgroundColor = .yellow}
                        Button("Green"){ backgroundColor = .green}
                    } message: {
                        Text("Select a new color")
                    }
                
            }.padding()
            
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(1.0, contentMode: .fit)
                .foregroundStyle(backgroundColor)
                .padding()
        }

        Spacer()
        

    }
    
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
