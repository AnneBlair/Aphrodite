//
//  LineBubbleDataSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

/// IBarLineScatterCandleBubbleChartDataSet
/// 蜡烛线间分散气泡图数据集
@objc
public protocol LineBubbleDataSet: ADataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    var highlightColor: Color { get set }
    var highlightLineWidth: CGFloat { get set }
    var highlightLineDashPhase: CGFloat { get set }
    var highlightLineDashLengths: [CGFloat]? { get set }
}
