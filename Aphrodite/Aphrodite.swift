//
//  Aphrodite.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/8.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public func printDebug<T>(_ message: T,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line
    )
{
    #if DEBUG
        print("------------------\(line) lineBegin-------------------------\n Class Name: \((file as NSString).lastPathComponent)\nMethod Name: \(method)\nMessage: \(message)\n------------------\(line) line  End-------------------------")
    #endif
}


