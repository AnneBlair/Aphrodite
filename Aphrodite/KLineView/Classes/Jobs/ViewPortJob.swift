//
//  ViewPortJob.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

// This defines a viewport modification job, used for delaying or animating viewport changes
@objc(AViewPortJob)
open class ViewPortJob: NSObject
{
    internal var point: CGPoint = CGPoint()
    internal weak var viewPortHandler: PortHandler?
    internal var xValue: Double = 0.0
    internal var yValue: Double = 0.0
    internal weak var transformer: Transformer?
    internal weak var view: CandleViewBase?
    
    public init(
        viewPortHandler: PortHandler,
        xValue: Double,
        yValue: Double,
        transformer: Transformer,
        view: CandleViewBase)
    {
        super.init()
        
        self.viewPortHandler = viewPortHandler
        self.xValue = xValue
        self.yValue = yValue
        self.transformer = transformer
        self.view = view
    }
    
    open func doJob()
    {
        // Override this
    }
}
