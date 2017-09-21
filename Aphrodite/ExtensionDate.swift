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
        return judge(format: "yyyyMMdd", date: date)
    }
    
    public func judgeSomeWeek(date: Date) -> Bool {
        return self.week == date.week
    }
    
    public func judgeSomeMonth(date: Date) -> Bool {
        return judge(format: "yyMM", date: date)
    }
    
    public func judgeSomeYear(date: Date) -> Bool {
        return judge(format: "yy", date: date)
    }
    
    fileprivate func judge(format: String, date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self) == formatter.string(from: date)
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
    
    public var week: Int {
        set {
            let date = Calendar.current.date(bySetting: .weekday, value: newValue, of: self)
            if let date = date {
                self = date
            }
        }
        get {
            return Calendar.current.component(.weekday, from: self)
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
