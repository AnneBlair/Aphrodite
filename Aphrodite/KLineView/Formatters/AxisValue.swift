//
//  AxisValue.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/18.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// IAxisValueFormatter
public protocol AxisValue: NSObjectProtocol {
    
    /// Called when a value from an axis is formatted before being drawn.
    ///
    /// For performance reasons, avoid excessive calculations and memory allocations inside this method.
    ///
    /// - returns: The customized label that is drawn on the x-axis.
    /// - parameter value:           the value that is currently being drawn
    /// - parameter axis:            the axis that the value belongs to
    ///
    func stringForValue(_ value: Double,
                        axis: AxisBase?) -> String
    
}
