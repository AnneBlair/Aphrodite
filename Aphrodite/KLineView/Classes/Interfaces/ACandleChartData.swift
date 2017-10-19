//
//  ACandleChartData.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// CandleChartDataProvider
@objc
public protocol ACandleChartData: LineBubbleDataProvider
{
    var candleData: CandleData? { get }
}
