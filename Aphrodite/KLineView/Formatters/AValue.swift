//
//  AValue.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/18.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// Interface that allows custom formatting of all values inside the chart before they are being drawn to the screen.
///
/// Simply create your own formatting class and let it implement ValueFormatter.
///
/// Then override the getFormattedValue(...) method and return whatever you want.
@objc(AValueFormatter)
public protocol AValueFormatter : NSObjectProtocol
{
    
    /// Called when a value (from labels inside the chart) is formatted before being drawn.
    ///
    /// For performance reasons, avoid excessive calculations and memory allocations inside this method.
    ///
    /// - returns: The formatted label ready for being drawn
    ///
    /// - parameter value:           The value to be formatted
    ///
    /// - parameter axis:            The entry the value belongs to - in e.g. BarChart, this is of class BarEntry
    ///
    /// - parameter dataSetIndex:    The index of the DataSet the entry in focus belongs to
    ///
    /// - parameter viewPortHandler: provides information about the current chart state (scale, translation, ...)
    ///
    func stringForValue(_ value: Double,
                        entry: ADataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: PortHandler?) -> String
}
