//
//  TransitionView.swift
//  Transition
//
//  Created by Yoon Ro on 2023-12-30.
//

import SwiftUI

struct TransitionView: View {
    
    @State var isAnimating: Bool = false
    
    
    var body: some View {
       
            VStack{
                

                
                GeometryReader{ geometry in
                    HStack{
                        Spacer()
                        if isAnimating {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: geometry.size.height * 0.5)
//                                .transition(AnyTransition.opacity.animation(.easeIn(duration: 1)))
                                .transition(.asymmetric(
                                    insertion: AnyTransition.opacity.animation(.easeIn(duration: 1)),
                                    removal: AnyTransition.scale.animation(.easeOut(duration: 1 + 1))
                                ))
                        }
                        Spacer()
                    }
            }
                
                Button("Button"){
                    withAnimation(Animation.easeOut(duration:1)){
                        isAnimating.toggle()
                    }
                }
        }.padding().glassBackgroundEffect()
    }
}

#Preview {
    TransitionView()
}
