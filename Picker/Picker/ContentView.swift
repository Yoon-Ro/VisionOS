//
//  ContentView.swift
//  Picker
//
//  Created by Yoon Ro on 2024-01-16.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var selection: String = "2"
    @State var filter: String = "Most Recent"
    
    let filterOptions: [String] = [
        "Most Recent", "Most Liked", "Most Popular"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {

  
        NavigationStack {
            
   
            
            
            Picker(selection: $selection, content: {
                ForEach(18..<100) { number in
                    Text("\(number)").tag("\(number)")
                }
            }, label: {
                HStack {
                    Text("Picker")
                    Text(selection)
                }
                
            }).pickerStyle(.inline).background().clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            
            
            Picker(selection: $selection, content: {
                ForEach(18..<100) { number in
                    Text("\(number)").tag("\(number)")
                }
            }, label: {
                HStack {
                    Text("Picker")
                    Text(selection)
                }
                
            }).pickerStyle(.navigationLink)
            
            Picker(selection: $selection, content: {
                ForEach(18..<100) { number in
                    Text("\(number)").tag("\(number)")
                }
            }, label: {
                HStack {
                    Text("Picker")
                    Text(selection)
                }
                
            })
            
            Picker(selection: $selection, content: {
                ForEach(18..<100) { number in
                    Text("\(number)").tag("\(number)")
                }
            }, label: {
                HStack {
                    Text("Picker")
                    Text(selection)
                }
                
            }).pickerStyle(.segmented)
            
            
            Picker(selection: $filter, content: {
                ForEach(filterOptions.indices) { index in
                    Text(filterOptions[index]).tag(filterOptions[index])
                }
            }, label: {
                HStack {
                    Text("Picker")
                    Text(selection)
                }
                
            }).pickerStyle(SegmentedPickerStyle())
            

            
            
                .navigationTitle("Picker")
                .toolbar {
         ToolbarItem(placement:
                 .bottomOrnament){
                     Picker(selection: $filter, content: {
                         ForEach(filterOptions, id: \.self) {option in
                             Text(option).tag(option)}
                     }, label: {
                         HStack{
                             Text("Filter:")
                             Text(filter)
                             Image(systemName: "heart.fill")
                         }
                     })  }}}.padding()
        
            
        
 
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
