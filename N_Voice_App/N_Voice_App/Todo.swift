//
//  Todo.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-30.
//

import Foundation

struct Todo: Hashable {
    var title: String
    var time: Date
    var day: Date
    var selected: Bool
    
    var convertedDayAndTime: String {
        String("Will be alarmed @ \(day.formattedDay) - \(time.formattedTime)")
    }
}
