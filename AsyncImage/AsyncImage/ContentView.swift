//
//  ContentView.swift
//  AsyncImage
//
//  Created by Yoon Ro on 2024-05-07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    let url = URL(string: "https://picsum.photos/500")
    
    var body: some View {
        VStack {
            
            AsyncImage(url: url) { phase in
                switch phase {
                    
                case .empty:
                    ProgressView()
                    
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width:300, height: 300)
                case .failure(let error):
                    Image(systemName: "questionmark")
                        .font(.headline)
                    
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
            
//            AsyncImage(url: url, content: { returnedImage in
//                returnedImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width:100, height: 100)
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
//            }, placeholder: {
//                ProgressView()}
//            )
            
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
                .shadow(radius: 10)

        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
