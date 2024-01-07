//
//  ContentView.swift
//  Alert
//
//  Created by Yoon Ro on 2024-01-06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var showAlert: Bool = false
    @State var color: Color = .red
    @State var alertType: MyAlert? = nil
    
    enum MyAlert {
        case success
        case error
    }
    
    var body: some View {
        HStack{
            Button("BUTTON 1"){
                alertType = .error
                showAlert.toggle()
            }
            Button("BUTTON 2"){
                alertType = .success
                showAlert.toggle()
            }
        }.alert(isPresented: $showAlert){
            getAlert()
        }
        
        Circle().frame(width: 100, height:100).foregroundStyle(color)
    }
    
    func getAlert() -> Alert {
        switch alertType{
        case .error:
                return Alert(title: Text("There was an error"))
        case .success:
                return Alert(title: Text("Successful"),         primaryButton: .destructive(Text("DELETE"), action: {
                    color = .red
                }),
                secondaryButton:. cancel())
        default:
            return Alert (title: Text("NOPE"))
        }
    }
}
#Preview(windowStyle: .automatic) {
    ContentView()
}
