//
//  ContentView.swift
//  Transition
//
//  Created by Yoon Ro on 2023-12-30.
//

import SwiftUI

struct ContentView: View {

    @State var showView: Bool = false
    let Timing: Double = 1.0

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack{
                    HStack{
                        Spacer()
                        Button("Button"){
                            withAnimation(Animation.easeInOut(duration: Timing)){
                                showView.toggle()

                            }
                        }.buttonStyle(.plain).padding().background(.blue).clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
                        Spacer()
                    }.offset(y: 20)
                    

                    
  
                   
                }
                Spacer()
                if showView {
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.5)
                        .opacity(showView ? 1.0 : 0.0)
                        .frame(depth: showView ? 400 : 0)
                        .foregroundStyle(Color.orange)
                        .offset(y: 250)
//                        .transition(.scale)
//                        .transition(.slide)
//                        .transition(.move(edge: .top))
//                        .transition(.opacity)
//                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: Timing)))
//                        .transition(AnyTransition.scale.animation(.easeInOut(duration: Timing)))
//                        .transition(.asymmetric(
//                            insertion: .slide,
//                            removal: .scale
//                        ))
                        .transition(.asymmetric(
                            insertion: AnyTransition.slide.animation(.easeIn(duration: Timing)),
                            removal: AnyTransition.scale.animation(.easeIn(duration: Timing + 1))
                        ))

                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
