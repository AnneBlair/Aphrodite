//
//  BarLineScatterCandleBubbleDataSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/22.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// BarLineScatterCandleBubbleChartDataSet
open class BarLineScatterCandleBubbleDataSet: DataSet, LineBubbleDataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    open var highlightColor = Color(red: 255.0/255.0, green: 187.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    open var highlightLineWidth = CGFloat(0.5)
    open var highlightLineDashPhase = CGFloat(0.0)
    open var highlightLineDashLengths: [CGFloat]?
    
    // MARK: - NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! BarLineScatterCandleBubbleDataSet
        copy.highlightColor = highlightColor
        copy.highlightLineWidth = highlightLineWidth
        copy.highlightLineDashPhase = highlightLineDashPhase
        copy.highlightLineDashLengths = highlightLineDashLengths
        return copy
    }
}
