//
//  ProfileView.swift
//  Onboarding
//
//  Created by Yoon Ro on 2024-05-01.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ProfileView: View {
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack{
//            Image(systemName: "person.circle.fill")
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "Your name goes here")
            Text("This user is \(currentUserAge ?? 0) years old")
            Text("Gender is \(currentUserGender ?? "unknown")")
            
            Button(action: {
                signOut()
            }, label: {
                Text("Sign out")
            })
        }
        .font(.title)
        .padding()
        .padding(.vertical, 40)
//        .background(.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 10)))
    }
    
    func signOut(){
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        currentUserSignedIn = false
    }
}

#Preview {
    ProfileView()
}
