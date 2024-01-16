//
//  ContentView.swift
//  Toggle
//
//  Created by Yoon Ro on 2024-01-15.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }.font(.title)
            Toggle(
                "Label",
                isOn: $toggleIsOn
            )
            .toggleStyle(SwitchToggleStyle(tint: .red))
            Spacer()
        }.padding(.horizontal, 100)
            .clipShape(RoundedRectangle(cornerRadius: 105.0, style: .continuous))
        
    }
 }

#Preview(windowStyle: .plain) {
    ContentView()
}
