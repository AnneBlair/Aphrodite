//
//  LineBubbleDataProvider.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

/// BarLineScatterCandleBubbleChartDataProvider
@objc
public protocol LineBubbleDataProvider: ADataProvider {
    func getTransformer(forAxis: YAxis.AxisDependency) -> Transformer
    func isInverted(axis: YAxis.AxisDependency) -> Bool
    
    var lowestVisibleX: Double { get }
    var highestVisibleX: Double { get }
}
