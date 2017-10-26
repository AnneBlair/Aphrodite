//
//  CandleDataEntry.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// CandleChartDataEntry
open class CandleDataEntry: ADataEntry {
    
    /// shadow-high value
    open var high = Double(0.0)
    
    /// shadow-low value
    open var low = Double(0.0)
    
    /// close value
    open var close = Double(0.0)
    
    /// open value
    open var open = Double(0.0)
    
    public required init() {
        super.init()
    }
    
    public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double) {
        super.init(x: x, y: (shadowH + shadowL) / 2.0)
        
        self.high = shadowH
        self.low = shadowL
        self.open = open
        self.close = close
    }
    
    public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, data: AnyObject?) {
        super.init(x: x, y: (shadowH + shadowL) / 2.0, data: data)
        
        self.high = shadowH
        self.low = shadowL
        self.open = open
        self.close = close
    }
    
    public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, icon: Image?) {
        super.init(x: x, y: (shadowH + shadowL) / 2.0, icon: icon)
        
        self.high = shadowH
        self.low = shadowL
        self.open = open
        self.close = close
    }
    
    public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, icon: Image?, data: AnyObject?) {
        super.init(x: x, y: (shadowH + shadowL) / 2.0, icon: icon, data: data)
        
        self.high = shadowH
        self.low = shadowL
        self.open = open
        self.close = close
    }
    
    /// - returns: The overall range (difference) between shadow-high and shadow-low.
    open var shadowRange: Double {
        return abs(high - low)
    }
    
    /// - returns: The body size (difference between open and close).
    open var bodyRange: Double {
        return abs(open - close)
    }
    
    /// the center value of the candle. (Middle value between high and low)
    open override var y: Double {
        get {
            return super.y
        }
        set {
            super.y = (high + low) / 2.0
        }
    }
    
    // MARK: NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject {
        let copy = super.copyWithZone(zone) as! CandleDataEntry
        copy.high = high
        copy.low = low
        copy.open = open
        copy.close = close
        return copy
    }
}

//MARK:            ________________Struct________________

















