//
//  ContentView.swift
//  addingAnimation
//
//  Created by Yoon Ro on 2023-11-28.
//

import SwiftUI

struct ContentView: View {

    @State var isAnimated: Bool = false


    var body: some View {
        NavigationStack{
            VStack{
                Button("Button")                {
//                    isAnimated.toggle()
//withAnimation(.default){isAnimated.toggle()}
//withAnimation(Animation.default.delay(2.0)){isAnimated.toggle()}
withAnimation(Animation.default.repeatCount(10, autoreverses: true)){isAnimated.toggle()}
                    
                }
                
                RoundedRectangle(cornerRadius: isAnimated ? 25.0 : 50)
                    .fill(isAnimated ? Color.green : Color.orange)
                    .frame(width: isAnimated ? 100 : 150, height: 100)
                    .offset(y: isAnimated ? 150 : 0)
                    .rotationEffect(Angle(degrees: isAnimated ? 180 : 0))
                    .frame(depth: isAnimated ? 200 : 0)
//                    .animation(Animation
//                        .default
//                        .repeatCount(5, autoreverses: true))
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
