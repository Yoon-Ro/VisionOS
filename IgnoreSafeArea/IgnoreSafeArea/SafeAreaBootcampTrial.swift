//
//  SafeAreaBootcampTrial.swift
//  IgnoreSafeArea
//
//  Created by Yoon Ro on 2023-09-11.
//

import Foundation
import SwiftUI

struct SafeAreaBootcampTrial: View {
    var body: some View {
        NavigationStack{
            ZStack {
                
                VStack {
                    Spacer()
                    Text("Hello, World!")
                    Spacer()
                }
                
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.brown)
                        .glassBackgroundEffect()
                        .padding()
                        .ignoresSafeArea()
   
            }

            .navigationTitle(Text("title"))
            .background(Color(#colorLiteral(red: 0.469854798, green: 0.2827930379, blue: 0.2340259091, alpha: 1)))
    
        }
        
        
        
    
    }
}

#Preview {
    SafeAreaBootcampTrial()
}
