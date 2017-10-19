//
//  ADataProvider.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

@objc
public protocol ADataProvider
{
    /// - returns: The minimum x-value of the chart, regardless of zoom or translation.
    var chartXMin: Double { get }
    
    /// - returns: The maximum x-value of the chart, regardless of zoom or translation.
    var chartXMax: Double { get }
    
    /// - returns: The minimum y-value of the chart, regardless of zoom or translation.
    var chartYMin: Double { get }
    
    /// - returns: The maximum y-value of the chart, regardless of zoom or translation.
    var chartYMax: Double { get }
    
    var maxHighlightDistance: CGFloat { get }
    
    var xRange: Double { get }
    
    var centerOffsets: CGPoint { get }
    
    var data: AData? { get }
    
    var maxVisibleCount: Int { get }
}
