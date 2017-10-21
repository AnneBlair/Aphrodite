//
//  AnimatedMoveViewJob.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/21.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

open class AnimatedMoveViewJob: AnimatedViewPortJob
{
    public override init(
        viewPortHandler: PortHandler,
        xValue: Double,
        yValue: Double,
        transformer: Transformer,
        view: CandleViewBase,
        xOrigin: CGFloat,
        yOrigin: CGFloat,
        duration: TimeInterval,
        easing: AEasingFunctionBlock?)
    {
        super.init(viewPortHandler: viewPortHandler,
                   xValue: xValue,
                   yValue: yValue,
                   transformer: transformer,
                   view: view,
                   xOrigin: xOrigin,
                   yOrigin: yOrigin,
                   duration: duration,
                   easing: easing)
    }
    
    internal override func animationUpdate()
    {
        guard
            let viewPortHandler = viewPortHandler,
            let transformer = transformer,
            let view = view
            else { return }
        
        var pt = CGPoint(
            x: xOrigin + (CGFloat(xValue) - xOrigin) * phase,
            y: yOrigin + (CGFloat(yValue) - yOrigin) * phase
        )
        
        transformer.pointValueToPixel(&pt)
        viewPortHandler.centerViewPort(pt: pt, chart: view)
    }
}
