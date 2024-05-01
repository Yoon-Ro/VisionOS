//
//  IntroView.swift
//  Onboarding
//
//  Created by Yoon Ro on 2024-04-30.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack{
            //background
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]),
                center: .topLeading,
                startRadius: 5,
                endRadius: 800)
            .ignoresSafeArea()
            
            
            //if user is signed in
            //profile view
            //else
            //onboarding view
            
            if currentUserSignedIn {
                Text("Profile View")
            } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    IntroView()
}
