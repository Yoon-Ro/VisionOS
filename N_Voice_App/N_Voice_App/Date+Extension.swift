//
//  Date+Extension.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-30.
//

import Foundation

extension Date {
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a hh:mm"
        
        return formatter.string(from: self)
    }
    
    var formattedDay: String {
        let now = Date()
        let calendar = Calendar.current
        let nowStartOfDay = calendar.startOfDay(for: now)
        let dateStartOfDay = calendar.startOfDay(for: self)
        let numOfDaysDifference = calendar.dateComponents([.day], from: nowStartOfDay, to: dateStartOfDay).day!
        
        if numOfDaysDifference == 0 {
            return "Today"
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M월 d일 E요일"
            
            return formatter.string(from: self)
        }
    }
}
