//
//  AIPieDataSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// IPieChartDataSet
@objc
public protocol AIPieDataSet: ADataSet
{
    // MARK: - Styling functions and accessors
    
    /// the space in pixels between the pie-slices
    /// **default**: 0
    /// **maximum**: 20
    var sliceSpace: CGFloat { get set }
    
    /// When enabled, slice spacing will be 0.0 when the smallest value is going to be smaller than the slice spacing itself.
    var automaticallyDisableSliceSpacing: Bool { get set }
    
    /// indicates the selection distance of a pie slice
    var selectionShift: CGFloat { get set }
    
    var xValuePosition: PieChartDataSet.ValuePosition { get set }
    var yValuePosition: PieChartDataSet.ValuePosition { get set }
    
    /// When valuePosition is OutsideSlice, indicates line color
    var valueLineColor: Color? { get set }
    
    /// When valuePosition is OutsideSlice, indicates line width
    var valueLineWidth: CGFloat { get set }
    
    /// When valuePosition is OutsideSlice, indicates offset as percentage out of the slice size
    var valueLinePart1OffsetPercentage: CGFloat { get set }
    
    /// When valuePosition is OutsideSlice, indicates length of first half of the line
    var valueLinePart1Length: CGFloat { get set }
    
    /// When valuePosition is OutsideSlice, indicates length of second half of the line
    var valueLinePart2Length: CGFloat { get set }
    
    /// When valuePosition is OutsideSlice, this allows variable line length
    var valueLineVariableLength: Bool { get set }
    
    /// the font for the slice-text labels
    var entryLabelFont: NSUIFont? { get set }
    
    /// the color for the slice-text labels
    var entryLabelColor: NSUIColor? { get set }
}
