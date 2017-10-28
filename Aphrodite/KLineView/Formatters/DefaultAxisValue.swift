//
//  DefaultAxisValue.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/18.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// DefaultAxisValueFormatter
@objc(ADefaultAxisValue)
open class DefaultAxisValue: NSObject, AxisValue {
    
    public typealias Block = (
        _ value: Double,
        _ axis: AxisBase?) -> String
    
    open var block: Block?
    
    open var hasAutoDecimals: Bool = false
    
    fileprivate var _formatter: NumberFormatter?
    
    open var formatter: NumberFormatter? {
        get { return _formatter }
        set {
            hasAutoDecimals = false
            _formatter = newValue
        }
    }
    
    fileprivate var _decimals: Int?
    
    open var decimals: Int? {
        get { return _decimals }
        set {
            _decimals = newValue
            
            if let digits = newValue {
                self.formatter?.minimumFractionDigits = digits
                self.formatter?.maximumFractionDigits = digits
                self.formatter?.usesGroupingSeparator = true
            }
        }
    }
    
    public override init() {
        super.init()
        
        self.formatter = NumberFormatter()
        hasAutoDecimals = true
    }
    
    public init(formatter: NumberFormatter) {
        super.init()
        self.formatter = formatter
    }
    
    public init(decimals: Int) {
        super.init()
        self.formatter = NumberFormatter()
        self.formatter?.usesGroupingSeparator = true
        self.decimals = decimals
        hasAutoDecimals = true
    }
    
    public init(block: @escaping Block) {
        super.init()
        
        self.block = block
    }
    
    public static func with(block: @escaping Block) -> DefaultAxisValue? {
        return DefaultAxisValue(block: block)
    }
    
    open func stringForValue(_ value: Double,
                             axis: AxisBase?) -> String {
        if block != nil {
            return block!(value, axis)
        } else {
            return formatter?.string(from: NSNumber(floatLiteral: value)) ?? ""
        }
    }
    
}
