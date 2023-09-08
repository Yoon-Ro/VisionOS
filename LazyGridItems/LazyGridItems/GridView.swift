//
//  GridView.swift
//  LazyGridItems
//
//  Created by Yoon Ro on 2023-09-07.
//

import Foundation
import SwiftUI

struct GridView: View {
    
    let columns : [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
        
    ]
    
    let title : String = "Title"
    
    var body: some View {
        ScrollView{
            
            Rectangle()
                .glassBackgroundEffect()
                .frame(height: 400)
  
            
            LazyVGrid(columns: [GridItem(.flexible()),
                                GridItem(.flexible())],
                      alignment: .center,
                      spacing: nil,
                      pinnedViews: [.sectionHeaders],
                      content: {

                
                Section(header: Text("Image Section #1")
                    .font(.extraLargeTitle)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .glassBackgroundEffect()
                    .padding()
                    
                        
                        ,content: {
                    ForEach(0..<4) {index in
                        Rectangle().frame(height: 150)
                            .foregroundStyle(.orange)
                    }
                })
                

            })
            
            
            LazyVGrid(columns: columns, content: {
                ForEach(0..<50) {index in
                    Rectangle().frame(height: 150)
                        .foregroundStyle(.white)
                }
            })
        }
        .glassBackgroundEffect()
        


    }
}

#Preview {
    GridView()
}
