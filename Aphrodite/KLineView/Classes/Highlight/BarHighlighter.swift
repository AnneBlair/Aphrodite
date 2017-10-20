//
//  BarHighlighter.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

@objc(ABarHighlighter)
open class BarHighlighter: CandleHighlighter
{
    open override func getHighlight(x: CGFloat, y: CGFloat) -> Highlight?
    {
        let high = super.getHighlight(x: x, y: y)
        
        if high == nil
        {
            return nil
        }
        
        if let barData = (self.chart as? ABarDataProvider)?.barData
        {
            let pos = getValsForTouch(x: x, y: y)
            
            if
                let set = barData.getDataSetByIndex(high!.dataSetIndex) as? AIBarDataSet,
                set.isStacked
            {
                return getStackedHighlight(high: high!,
                                           set: set,
                                           xValue: Double(pos.x),
                                           yValue: Double(pos.y))
            }
            
            return high
        }
        return nil
    }
    
    internal override func getDistance(x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat) -> CGFloat
    {
        return abs(x1 - x2)
    }
    
    internal override var data: AData?
    {
        return (chart as? ABarDataProvider)?.barData
    }
    
    /// This method creates the Highlight object that also indicates which value of a stacked BarEntry has been selected.
    /// - parameter high: the Highlight to work with looking for stacked values
    /// - parameter set:
    /// - parameter xIndex:
    /// - parameter yValue:
    /// - returns:
    open func getStackedHighlight(high: Highlight,
                                  set: AIBarDataSet,
                                  xValue: Double,
                                  yValue: Double) -> Highlight?
    {
        guard
            let chart = self.chart as? LineBubbleDataProvider,
            let entry = set.entryForXValue(xValue, closestToY: yValue) as? ABarDataEntry
            else { return nil }
        
        // Not stacked
        if entry.yValues == nil
        {
            return high
        }
        
        if let ranges = entry.ranges,
            ranges.count > 0
        {
            let stackIndex = getClosestStackIndex(ranges: ranges, value: yValue)
            
            let pixel = chart
                .getTransformer(forAxis: set.axisDependency)
                .pixelForValues(x: high.x, y: ranges[stackIndex].to)
            
            return Highlight(x: entry.x,
                             y: entry.y,
                             xPx: pixel.x,
                             yPx: pixel.y,
                             dataSetIndex: high.dataSetIndex,
                             stackIndex: stackIndex,
                             axis: high.axis)
        }
        
        return nil
    }
    
    /// - returns: The index of the closest value inside the values array / ranges (stacked barchart) to the value given as a parameter.
    /// - parameter entry:
    /// - parameter value:
    /// - returns:
    open func getClosestStackIndex(ranges: [Range]?, value: Double) -> Int
    {
        if ranges == nil
        {
            return 0
        }
        
        var stackIndex = 0
        
        for range in ranges!
        {
            if range.contains(value)
            {
                return stackIndex
            }
            else
            {
                stackIndex += 1
            }
        }
        
        let length = max(ranges!.count - 1, 0)
        
        return (value > ranges![length].to) ? length : 0
    }
}
