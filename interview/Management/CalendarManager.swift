//
//  CalendarManager.swift
//  interview
//
//  Created by Anh Kiet on 19/08/2024.
//  Copyright © 2024 DAKiet. All rights reserved.
//

import Foundation

struct Day {
    let date: Date
    let number: String
    let isNow: Bool
    let isSunday: Bool
    let isSaturday: Bool
    let isWithinDisplayedMonth: Bool
}

final class CalendarManager {
    
    // MARK: Properties
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: Localize.shared.currentLanguage().rawValue)
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//        Locale(identifier: "en_US_POSIX")
        
        return dateFormatter
    }()
    
    let calendar: Calendar = {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        calendar.locale = Locale(identifier: Localize.shared.currentLanguage().rawValue)
        
        return calendar
    }()
    
    var dateFormat: String = "dd/MM/yyyy HH:mm:ss" {
        didSet {
            dateFormatter.dateFormat = dateFormat
        }
    }
    
    var shortWeekdaySymbols: [String] {
        dateFormatter.shortWeekdaySymbols
    }
    
    // MARK: Methods
    func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func date(from string: String) -> Date? {
        return dateFormatter.date(from: string)
    }
    
    func getWeekday() -> [Date] {
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let days = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
            .filter { !calendar.isDateInWeekend($0) }
        
        return days
    }
    
    func generatedDates(for dateInterval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates = [dateInterval.start]
        
        calendar.enumerateDates(startingAfter: dateInterval.start,
                                matching: components,
                                matchingPolicy: .nextTime) { date, _, stop in
            guard let date = date else { return }
            
            guard date < dateInterval.end else {
                stop = true
                return
            }
            
            dates.append(date)
        }
        
        return dates
    }
    
    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generatedDates(for: dateInterval,
                       matching: calendar.dateComponents([.hour, .minute, .second],
                                                                            from: dateInterval.start))
    }
}

extension CalendarManager {
    
    func addMonths(date: Date, months: Int) -> Date {
        return calendar.date(byAdding: .month, value: months, to: date)!
    }
    
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        return range.count
    }
    
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        
        return components.day!
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        
        return calendar.date(from: components)!
    }
    
    func firstDayWeekday(date: Date) -> Int {
        let date = calendar.component(.weekday, from: date)
        
        return date
    }
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func generateDay(offsetBy dayOffset: Int, for firstDate: Date, isWithinDisplayedMonth: Bool) -> Day {
        let dateformater = DateFormatter()
        dateformater.dateFormat = "d"
        let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDate) ?? firstDate
        
        return Day(date: date,
                   number: dateformater.string(from: date),
                   isNow: calendar.isDateInToday(date),
                   isSunday: calendar.component(.weekday, from: date) == 1,
                   isSaturday: calendar.component(.weekday, from: date) == 7,
                   isWithinDisplayedMonth: isWithinDisplayedMonth)
    }
    
    func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date) -> [Day] {
        guard let lastDayInMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1),
                                                 to: firstDayOfDisplayedMonth) else { return [] }
        
        let addidtionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth)
        
        guard addidtionalDays > 0 else { return [] }
        
        let days: [Day] = (1...addidtionalDays).map {
            generateDay(offsetBy: $0,
                        for: lastDayInMonth,
                        isWithinDisplayedMonth: false)
        }
        
        return days
    }
}
