//
//  CandleDataSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/22.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation


/// CandleChartDataSet
open class CandleDataSet: ALineScatterCandleRadarDataSet, ACandleDataSet
{
    
    public required init()
    {
        super.init()
    }
    
    public override init(values: [ADataEntry]?, label: String?)
    {
        super.init(values: values, label: label)
    }
    
    // MARK: - Data functions and accessors
    
    open override func calcMinMax(entry e: ADataEntry)
    {
        guard let e = e as? CandleDataEntry
            else { return }
        
        if e.low < _yMin
        {
            _yMin = e.low
        }
        
        if e.high > _yMax
        {
            _yMax = e.high
        }
        
        calcMinMaxX(entry: e)
    }
    
    open override func calcMinMaxY(entry e: ADataEntry)
    {
        guard let e = e as? CandleDataEntry
            else { return }
        
        if e.high < _yMin
        {
            _yMin = e.high
        }
        if e.high > _yMax
        {
            _yMax = e.high
        }
        
        if e.low < _yMin
        {
            _yMin = e.low
        }
        if e.low > _yMax
        {
            _yMax = e.low
        }
    }
    
    // MARK: - Styling functions and accessors
    
    /// the space between the candle entries
    ///
    /// **default**: 0.1 (10%)
    fileprivate var _barSpace = CGFloat(0.1)
    
    /// the space that is left out on the left and right side of each candle,
    /// **default**: 0.1 (10%), max 0.45, min 0.0
    open var barSpace: CGFloat
        {
        set
        {
            if newValue < 0.0
            {
                _barSpace = 0.0
            }
            else if newValue > 0.45
            {
                _barSpace = 0.45
            }
            else
            {
                _barSpace = newValue
            }
        }
        get
        {
            return _barSpace
        }
    }
    
    /// should the candle bars show?
    /// when false, only "ticks" will show
    ///
    /// **default**: true
    open var showCandleBar: Bool = true
    
    /// the width of the candle-shadow-line in pixels.
    ///
    /// **default**: 1.5
    open var shadowWidth = CGFloat(1.5)
    
    /// the color of the shadow line
    open var shadowColor: Color?
    
    /// use candle color for the shadow
    open var shadowColorSameAsCandle = false
    
    /// Is the shadow color same as the candle color?
    open var isShadowColorSameAsCandle: Bool { return shadowColorSameAsCandle }
    
    /// color for open == close
    open var neutralColor: Color?
    
    /// color for open > close
    open var increasingColor: Color?
    
    /// color for open < close
    open var decreasingColor: Color?
    
    /// Are increasing values drawn as filled?
    /// increasing candlesticks are traditionally hollow
    open var increasingFilled = false
    
    /// Are increasing values drawn as filled?
    open var isIncreasingFilled: Bool { return increasingFilled }
    
    /// Are decreasing values drawn as filled?
    /// descreasing candlesticks are traditionally filled
    open var decreasingFilled = true
    
    /// Are decreasing values drawn as filled?
    open var isDecreasingFilled: Bool { return decreasingFilled }
}