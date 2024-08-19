//
//  Double+Extensions.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

extension Double {
    
    private var calendar: Calendar {
        let manager = CalendarManager()
        
        return manager.calendar
    }
    
    func toString(_ dateFormat: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = calendar.locale
        dateFormatter.timeZone = calendar.timeZone
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: date)
    }
}
