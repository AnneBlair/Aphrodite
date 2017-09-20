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

extension Date {
    
    public func judgeSomeMinute(date: Date) -> Bool {
        return judge(format: "yyyyMMyyhhmm", date: date)
    }
    
    public func judgeSomeHour(date: Date) -> Bool {
        return judge(format: "yyyyMMyyhh", date: date)
    }
    
    public func judgeSomeDay(date: Date ) -> Bool {
        return judge(format: "yyyyMMdd", date: date)
    }
    
    public func judgeSomeMoon(date: Date) -> Bool {
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
