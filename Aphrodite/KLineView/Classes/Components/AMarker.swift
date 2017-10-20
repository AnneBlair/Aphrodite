//
//  AMarker.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// IMarker  IChartMarker
public protocol AMarker: NSObjectProtocol
{
    /// - returns: The desired (general) offset you wish the IMarker to have on the x-axis.
    ///
    /// By returning x: -(width / 2) you will center the IMarker horizontally.
    ///
    /// By returning y: -(height / 2) you will center the IMarker vertically.
    var offset: CGPoint { get }
    
    /// - returns: The offset for drawing at the specific `point`.
    ///            This allows conditional adjusting of the Marker position.
    ///            If you have no adjustments to make, return self.offset().
    ///
    /// - parameter point: This is the point at which the marker wants to be drawn. You can adjust the offset conditionally based on this argument.
    func offsetForDrawing(atPoint: CGPoint) -> CGPoint
    
    /// This method enables a custom IMarker to update it's content every time the IMarker is redrawn according to the data entry it points to.
    ///
    /// - parameter entry: The Entry the IMarker belongs to. This can also be any subclass of Entry, like BarEntry or CandleEntry, simply cast it at runtime.
    /// - parameter highlight: The highlight object contains information about the highlighted value such as it's dataset-index, the selected range or stack-index (only stacked bar entries).
    func refreshContent(entry: ADataEntry, highlight: Highlight)
    
    /// Draws the IMarker on the given position on the given context
    func draw(context: CGContext, point: CGPoint)
}
