//
//  ExtensionDate.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    formatter.doesRelativeDateFormatting = true
    formatter.formattingContext = .standalone
    return formatter
}()

public extension Date {
    
    public func judgeSomeMinute(date: Date) -> Bool {
        return judge(format: "yyyyMMyyhhmm", date: date)
    }
    
    public func judgeSomeHour(date: Date) -> Bool {
        return judge(format: "yyyyMMyyhh", date: date)
    }
    
    public func judgeSomeDay(date: Date ) -> Bool {
        return Calendar.current.isDate(date, inSameDayAs: self)
    }
    
    public func judgeSomeWeek(date: Date) -> Bool {
        return self.year == date.year && self.week == date.week && self.month == date.month
    }
    
    public func judgeSomeMonth(date: Date) -> Bool {
        return judge(format: "yyMM", date: date)
    }
    
    public func judgeSomeYear(date: Date) -> Bool {
        return self.year == date.year
    }
    
    fileprivate func judge(format: String, date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self) == formatter.string(from: date)
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isWeekend: Bool {
        return Calendar.current.isDateInWeekend(self)
    }
}

extension Date {
    
    public mutating func add(_ component: Calendar.Component, value: Int) {
        self = Calendar.current.date(byAdding: component, value: value, to: self) ?? Date(timeIntervalSince1970: 0)
    }
}

public extension Date {
    public var minute: Int {
        set {
            let date = Calendar.current.date(bySetting: .minute, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.minute, from: self)
        }
    }
    
    public var hour: Int {
        set {
            let date = Calendar.current.date(bySetting: .hour, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.hour, from: self)
        }
    }
    
    public var day: Int {
        set {
            let date = Calendar.current.date(bySetting: .day, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.day, from: self)
        }
    }
    
    /// Week In The Month
    public var week: Int {
        set {
            let date = Calendar.current.date(bySetting: .weekOfMonth, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.weekday, from: self)
        }
    }
    
    /// Week In The Year
    var weekForYear: Int {
        set {
            let date = Calendar.current.date(bySetting: .weekOfYear, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.weekOfYear, from: self)
        }
    }
    
    public var month: Int {
        set {
            let date = Calendar.current.date(bySetting: .month, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.month, from: self)
        }
    }
    
    public var year: Int {
        set {
            let date = Calendar.current.date(bySetting: .year, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.year, from: self)
        }
    }
}
