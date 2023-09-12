//
//  SafeAreaBootcamp.swift
//  IgnoreSafeArea
//
//  Created by Yoon Ro on 2023-09-11.
//

import Foundation
import SwiftUI

struct SafeAreaBootcamp : View {
    var body: some View {
        
        
        NavigationStack{
            ScrollView{
                VStack{
                    
                    Text("How to ignore the safe area")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(0..<10) {index in
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(maxWidth: .infinity, minHeight: 200)
                            .shadow(radius: 10)
                            .padding(.vertical, 10)
                    }
                }//VSTACK
                .padding()
                .background(.gray)
                .ignoresSafeArea()
            }
            
            .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)
            .background(.blue)
//            .ignoresSafeArea()
        }

    }
}

#Preview {
    SafeAreaBootcamp()
}
