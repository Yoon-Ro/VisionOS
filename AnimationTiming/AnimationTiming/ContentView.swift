import SwiftUI

struct ContentView : View {
    
    @State var isAnimating: Bool = false
    @State var isAnimatingLinear: Bool = false
    @State var isAnimatingEaseIn: Bool = false
    @State var isAnimatingEaseInOut: Bool = false
    @State var isAnimatingEaseOut: Bool = false
    @State var isAnimatingSpring: Bool = false




    
    let timing: Double = 1.0

    
    var body: some View {
        HStack{
            VStack{
                Button("Button"){
                    withAnimation(Animation.default){
                        isAnimating.toggle()
                    }
                }//Button
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimating ? 300 : 100)
            }
            
            VStack{
                Button("Linear"){
                    withAnimation(Animation.linear(duration: timing)){isAnimatingLinear.toggle()
                    }
                                  }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimatingLinear ? 300 : 100)
                    .foregroundStyle(.orange)
            }
            
            VStack{
                Button("Ease In"){
                    withAnimation(Animation.easeIn(duration: timing)){isAnimatingEaseIn.toggle()
                    }
                                  }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimatingEaseIn ? 300 : 100)
                    .foregroundStyle(.green)
            }
            
            VStack{
                Button("Ease In Out"){
                    withAnimation(Animation.easeInOut(duration: timing)){isAnimatingEaseInOut.toggle()
                    }
                                  }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimatingEaseInOut ? 300 : 100)
                    .foregroundStyle(.purple)
            }
            
            VStack{
                Button("Ease Out"){
                    withAnimation(Animation.easeOut(duration: timing)){isAnimatingEaseOut.toggle()
                    }
                                  }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimatingEaseOut ? 300 : 100)
                    .foregroundStyle(.white)
            }
            
            VStack{
                Button("Spring"){
                    withAnimation(Animation.spring(response: 1.0, dampingFraction: 0.05, blendDuration: timing)){isAnimatingSpring.toggle()
                    }
                                  }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100, height: isAnimatingSpring ? 300 : 100)
                    .foregroundStyle(.teal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
