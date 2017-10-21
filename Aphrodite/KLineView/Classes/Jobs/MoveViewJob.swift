//
//  MoveViewJob.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/21.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

@objc(AMoveViewJob)
open class MoveViewJob: ViewPortJob
{
    public override init(
        viewPortHandler: PortHandler,
        xValue: Double,
        yValue: Double,
        transformer: Transformer,
        view: CandleViewBase)
    {
        super.init(
            viewPortHandler: viewPortHandler,
            xValue: xValue,
            yValue: yValue,
            transformer: transformer,
            view: view)
    }
    
    open override func doJob()
    {
        guard
            let viewPortHandler = viewPortHandler,
            let transformer = transformer,
            let view = view
            else { return }
        
        var pt = CGPoint(
            x: CGFloat(xValue),
            y: CGFloat(yValue)
        )
        
        transformer.pointValueToPixel(&pt)
        viewPortHandler.centerViewPort(pt: pt, chart: view)
    }
}
