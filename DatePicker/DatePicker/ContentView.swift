//
//  ContentView.swift
//  DatePicker
//
//  Created by Yoon Ro on 2024-01-18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var selectDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    var body: some View {
//        DatePicker("Select a Date", selection: $selectDate)
//        DatePicker("Select a Date", selection: $selectDate, displayedComponents: [.date, .hourAndMinute])
        
        VStack {
            Text("Selected date is:")
            Text(dateFormatter.string(from: selectDate)).font(.title)
            DatePicker("Select a Date", selection: $selectDate, in: startingDate...endingDate)
                .datePickerStyle(.automatic)
                .padding(.all, 30)
                .glassBackgroundEffect()
            Text("If you are reading, press like button").opacity(0.2)
        }
        .padding()
        
        
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
