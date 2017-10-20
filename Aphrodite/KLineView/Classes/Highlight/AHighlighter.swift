//
//  AHighlighter.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// IHighlighter
@objc(AChartHighlighter)
public protocol AHighlighter : NSObjectProtocol
{
    /// - returns: A Highlight object corresponding to the given x- and y- touch positions in pixels.
    /// - parameter x:
    /// - parameter y:
    /// - returns:
    func getHighlight(x: CGFloat, y: CGFloat) -> Highlight?
}
