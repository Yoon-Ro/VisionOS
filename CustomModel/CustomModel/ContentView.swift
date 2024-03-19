//
//  ContentView.swift
//  CustomModel
//
//  Created by Yoon Ro on 2024-03-18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct UserModel: Identifiable{
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ContentView: View {
    
    @State var users: [UserModel] = [
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emma", userName: "emma123", followerCount: 123, isVerified: false),
        UserModel(displayName: "Samuel", userName: "sam123", followerCount: 999, isVerified: false),
        UserModel(displayName: "Christ", userName: "christ666", followerCount: 666, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 16) {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text(user.userName)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        
                        if user.isVerified{
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        } else {
    
                        }
                        HStack{
                            Text("\(user.followerCount)")
                            Text("followers").font(.caption)
                        }
                    }
                    .padding(.vertical, 8)
                }
    
            }
            .navigationTitle("Custom Model")
        }//END: NAV
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
