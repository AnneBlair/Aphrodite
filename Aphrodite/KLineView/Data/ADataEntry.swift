//
//  ADataEntry.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/18.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

open class ADataEntry: AEntryBase {
    
    @objc open var x = Double(0.0)
    
    public required init() {
        super.init()
    }
    
    /// An Entry represents one single entry in the chart.
    /// - parameter x: the x value
    /// - parameter y: the y value (the actual value of the entry)
    public init(x: Double, y: Double) {
        super.init(y: y)
        
        self.x = x
    }
    
    /// An Entry represents one single entry in the chart.
    /// - parameter x: the x value
    /// - parameter y: the y value (the actual value of the entry)
    /// - parameter data: Space for additional data this Entry represents.
    
    public init(x: Double, y: Double, data: AnyObject?) {
        super.init(y: y)
        
        self.x = x
        
        self.data = data
    }
    
    /// An Entry represents one single entry in the chart.
    /// - parameter x: the x value
    /// - parameter y: the y value (the actual value of the entry)
    /// - parameter icon: icon image
    
    public init(x: Double, y: Double, icon: Image?) {
        super.init(y: y, icon: icon)
        
        self.x = x
    }
    
    /// An Entry represents one single entry in the chart.
    /// - parameter x: the x value
    /// - parameter y: the y value (the actual value of the entry)
    /// - parameter icon: icon image
    /// - parameter data: Space for additional data this Entry represents.
    
    public init(x: Double, y: Double, icon: Image?, data: AnyObject?) {
        super.init(y: y, icon: icon, data: data)
        
        self.x = x
    }
    
    // MARK: NSObject
    
    open override func isEqual(_ object: Any?) -> Bool {
        if !super.isEqual(object) {
            return false
        }
        
        if fabs((object! as AnyObject).x - x) > Double.ulpOfOne {
            return false
        }
        
        return true
    }
    
    // MARK: NSObject
    
    open override var description: String {
        return "ADataEntry, x: \(x), y \(y)"
    }
    
    // MARK: NSCopying
    
    open func copyWithZone(_ zone: NSZone?) -> AnyObject {
        let copy = type(of: self).init()
        copy.x = x
        copy.y = y
        copy.data = data
        
        return copy
    }
}