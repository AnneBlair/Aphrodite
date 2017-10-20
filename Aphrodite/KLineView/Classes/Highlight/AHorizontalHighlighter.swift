//
//  AHorizontalHighlighter.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

///  HorizontalBarHighlighter
@objc(AHorizontalBarHighlighter)
open class AHorizontalHighlighter: BarHighlighter
{
    open override func getHighlight(x: CGFloat, y: CGFloat) -> Highlight?
    {
        if let barData = self.chart?.data as? BarChartData
        {
            let pos = getValsForTouch(x: y, y: x)
            
            guard let high = getHighlight(xValue: Double(pos.y), x: y, y: x)
                else { return nil }
            
            if let set = barData.getDataSetByIndex(high.dataSetIndex) as? AIBarDataSet,
                set.isStacked
            {
                return getStackedHighlight(high: high,
                                           set: set,
                                           xValue: Double(pos.y),
                                           yValue: Double(pos.x))
            }
            
            return high
        }
        return nil
    }
    
    internal override func buildHighlights(
        dataSet set: ADataSet,
        dataSetIndex: Int,
        xValue: Double,
        rounding: ASetRounding) -> [Highlight]
    {
        var highlights = [Highlight]()
        
        guard let chart = self.chart as? LineBubbleDataProvider
            else { return highlights }
        
        var entries = set.entriesForXValue(xValue)
        if entries.count == 0
        {
            // Try to find closest x-value and take all entries for that x-value
            if let closest = set.entryForXValue(xValue, closestToY: Double.nan, rounding: rounding)
            {
                entries = set.entriesForXValue(closest.x)
            }
        }
        
        for e in entries
        {
            let px = chart.getTransformer(forAxis: set.axisDependency).pixelForValues(x: e.y, y: e.x)
            
            highlights.append(Highlight(x: e.x, y: e.y, xPx: px.x, yPx: px.y, dataSetIndex: dataSetIndex, axis: set.axisDependency))
        }
        
        return highlights
    }
    
    internal override func getDistance(x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat) -> CGFloat
    {
        return abs(y1 - y2)
    }
}
