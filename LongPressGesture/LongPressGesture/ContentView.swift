import SwiftUI

struct ContentView: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false

    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxHeight: isSuccess ? .infinity : (isComplete ? .infinity : 0)) // Keep maxHeight .infinity if isSuccess
                .frame(width: 55)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .background()
                .padding()

            HStack {
                Text(isSuccess ? "SUCCESS" : "PRESS HERE")
                    .padding()
                    .glassBackgroundEffect()
                    .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 50) { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                isComplete = true
                            }
                        } else {
                            if !isSuccess {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    isComplete = false
                                }
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
            }

            Text("RESET")
                .padding()
                .glassBackgroundEffect()
                .onTapGesture {
                    isComplete = false
                    isSuccess = false
                }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
