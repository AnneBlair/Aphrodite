//
//  PieDataEntry.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// PieChartDataEntry
open class PieDataEntry: ADataEntry
{
    public required init()
    {
        super.init()
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter label: The label for the x-axis
    public convenience init(value: Double, label: String?)
    {
        self.init(value: value, label: label, icon: nil, data: nil)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter label: The label for the x-axis
    /// - parameter data: Spot for additional data this Entry represents
    public convenience init(value: Double, label: String?, data: AnyObject?)
    {
        self.init(value: value, label: label, icon: nil, data: data)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter label: The label for the x-axis
    /// - parameter icon: icon image
    public convenience init(value: Double, label: String?, icon: Image?)
    {
        self.init(value: value, label: label, icon: icon, data: nil)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter label: The label for the x-axis
    /// - parameter icon: icon image
    /// - parameter data: Spot for additional data this Entry represents
    public init(value: Double, label: String?, icon: Image?, data: AnyObject?)
    {
        super.init(x: 0.0, y: value, icon: icon, data: data)
        
        self.label = label
    }
    
    /// - parameter value: The value on the y-axis
    public convenience init(value: Double)
    {
        self.init(value: value, label: nil, icon: nil, data: nil)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter data: Spot for additional data this Entry represents
    public convenience init(value: Double, data: AnyObject?)
    {
        self.init(value: value, label: nil, icon: nil, data: data)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter icon: icon image
    public convenience init(value: Double, icon: Image?)
    {
        self.init(value: value, label: nil, icon: icon, data: nil)
    }
    
    /// - parameter value: The value on the y-axis
    /// - parameter icon: icon image
    /// - parameter data: Spot for additional data this Entry represents
    public convenience init(value: Double, icon: Image?, data: AnyObject?)
    {
        self.init(value: value, label: nil, icon: icon, data: data)
    }
    
    // MARK: Data property accessors
    
    open var label: String?
    
    open var value: Double
        {
        get { return y }
        set { y = value }
    }
    
    @available(*, deprecated: 1.0, message: "Pie entries do not have x values")
    open override var x: Double
        {
        get
        {
            print("Pie entries do not have x values")
            return super.x
        }
        set
        {
            super.x = newValue
            print("Pie entries do not have x values")
        }
    }
    
    // MARK: NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! PieDataEntry
        copy.label = label
        return copy
    }
}
