//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Yoon Ro on 2024-05-18.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button below to manage your tasks")
                

                NavigationLink(destination: AddView( alertTitle: ""), label: {
                    Text("Add something 📝")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 500)
                        
                }).padding(.top, animate ? 40 : 700)

            }
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
 
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView().background()
}
