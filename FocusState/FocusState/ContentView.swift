//
//  ContentView.swift
//  FocusState
//
//  Created by Yoon Ro on 2024-05-08.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
//    @FocusState private var usernameInFocus: Bool
    @State private var username: String = ""
    
//    @FocusState private var passwordInFocus: Bool
    @State private var password: String = ""
    @FocusState private var fieldInFocus: OnboardingField?

    var body: some View {
        NavigationStack{
            TextField("Add youe name here", text: $username)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.15))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
            
            SecureField("Add youe name here", text: $password)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.15))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
      
            Button("SIGN UP"){
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("SIGN UP")
                } else if usernameIsValid {
                    fieldInFocus = .password
                } else {
                    fieldInFocus = .username
                }
            }
        
//            Button("Toggle Focus State") {
//                usernameInFocus.toggle()
//            }
            
          
        }
        .padding(40)
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.usernameInFocus = true
//            }
//        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
