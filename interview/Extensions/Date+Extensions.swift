//
//  Date+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

extension Date {
    
    private var calendar: Calendar {
        let manager = CalendarManager()
        
        return manager.calendar
    }
    
    var suffix: String {
        let dayNumber = calendar.component(.day, from: self)
        
        switch dayNumber {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
    
    var dateIgnoreTime: Date {
        var todayComponents = calendar.dateComponents([
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ], from: self)
        todayComponents.hour = 0
        todayComponents.minute = 0
        todayComponents.second = 0
        
        return calendar.date(from: todayComponents)!
    }
    
    var startOfWeek: Date {
        let sunday = calendar.date(from: calendar.dateComponents([
            .yearForWeekOfYear,
            .weekOfYear
        ], from: self))!
        
        return sunday
    }
    
    func toString(_ dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = calendar.locale
        dateFormatter.timeZone = calendar.timeZone
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
}
