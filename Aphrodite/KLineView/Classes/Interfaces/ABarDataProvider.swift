//
//  ABarDataProvider.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// BarChartDataProvider
@objc
public protocol ABarDataProvider: LineBubbleDataProvider
{
    var barData: BarChartData? { get }
    
    var isDrawBarShadowEnabled: Bool { get }
    var isDrawValueAboveBarEnabled: Bool { get }
    var isHighlightFullBarEnabled: Bool { get }
}
