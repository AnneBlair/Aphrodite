//
//  CandleStickView.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/22.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// CandleStickChartView
/// Financial chart type that draws candle-sticks.
open class CandleStickView: BarLineCandleViewBase, ACandleChartData
{
    internal override func initialize()
    {
        super.initialize()
        
        renderer = CandleStick(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
        
        self.xAxis.spaceMin = 0.5
        self.xAxis.spaceMax = 0.5
    }
    
    // MARK: - CandleChartDataProvider
    
    open var candleData: CandleData?
    {
        return _data as? CandleData
    }
}
