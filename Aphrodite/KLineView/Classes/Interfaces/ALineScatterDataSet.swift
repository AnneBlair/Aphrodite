//
//  ALineScatterDataSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// ILineScatterCandleRadarChartDataSet
@objc
public protocol ALineScatterDataSet: LineBubbleDataSet {
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    /// Enables / disables the horizontal highlight-indicator. If disabled, the indicator is not drawn.
    var drawHorizontalHighlightIndicatorEnabled: Bool { get set }
    
    /// Enables / disables the vertical highlight-indicator. If disabled, the indicator is not drawn.
    var drawVerticalHighlightIndicatorEnabled: Bool { get set }
    
    /// - returns: `true` if horizontal highlight indicator lines are enabled (drawn)
    var isHorizontalHighlightIndicatorEnabled: Bool { get }
    
    /// - returns: `true` if vertical highlight indicator lines are enabled (drawn)
    var isVerticalHighlightIndicatorEnabled: Bool { get }
    
    /// Enables / disables both vertical and horizontal highlight-indicators.
    /// :param: enabled
    func setDrawHighlightIndicators(_ enabled: Bool)
}
