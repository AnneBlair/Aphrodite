//
//  DataRenderer.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

@objc(ADataRendererBase)
open class DataRenderer: Renderer
{
    open var animator: Animator?

    public init(animator: Animator?, viewPortHandler: PortHandler?)
    {
        super.init(viewPortHandler: viewPortHandler)

        self.animator = animator
    }

    open func drawData(context: CGContext)
    {
        fatalError("drawData() cannot be called on DataRenderer")
    }

    open func drawValues(context: CGContext)
    {
        fatalError("drawValues() cannot be called on DataRenderer")
    }

    open func drawExtras(context: CGContext)
    {
        fatalError("drawExtras() cannot be called on DataRenderer")
    }

    /// Draws all highlight indicators for the values that are currently highlighted.
    ///
    /// - parameter indices: the highlighted values
    open func drawHighlighted(context: CGContext, indices: [Highlight])
    {
        fatalError("drawHighlighted() cannot be called on DataRenderer")
    }

    /// An opportunity for initializing internal buffers used for rendering with a new size.
    /// Since this might do memory allocations, it should only be called if necessary.
    open func initBuffers() { }

    open func isDrawingValuesAllowed(dataProvider: ADataProvider?) -> Bool
    {
        guard let data = dataProvider?.data
            else { return false }

        return data.entryCount < Int(CGFloat(dataProvider?.maxVisibleCount ?? 0) * (viewPortHandler?.scaleX ?? 1.0))
    }
}

