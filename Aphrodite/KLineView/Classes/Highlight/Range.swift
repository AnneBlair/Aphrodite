//
//  Range.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

@objc(ARange)
open class Range: NSObject
{
    open var from: Double
    open var to: Double
    
    public init(from: Double, to: Double)
    {
        self.from = from
        self.to = to
        
        super.init()
    }
    
    /// - returns: `true` if this range contains (if the value is in between) the given value, `false` ifnot.
    /// - parameter value:
    open func contains(_ value: Double) -> Bool
    {
        if value > from && value <= to
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    open func isLarger(_ value: Double) -> Bool
    {
        return value > to
    }
    
    open func isSmaller(_ value: Double) -> Bool
    {
        return value < from
    }
}
