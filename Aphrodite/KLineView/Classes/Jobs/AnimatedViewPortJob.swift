//
//  AnimatedViewPortJob.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/21.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

open class AnimatedViewPortJob: ViewPortJob
{
    internal var phase: CGFloat = 1.0
    internal var xOrigin: CGFloat = 0.0
    internal var yOrigin: CGFloat = 0.0
    
    fileprivate var _startTime: TimeInterval = 0.0
    fileprivate var _displayLink: DisplayLink!
    fileprivate var _duration: TimeInterval = 0.0
    fileprivate var _endTime: TimeInterval = 0.0
    
    fileprivate var _easing: AEasingFunctionBlock?
    
    public init(
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
                   view: view)
        
        self.xOrigin = xOrigin
        self.yOrigin = yOrigin
        self._duration = duration
        self._easing = easing
    }
    
    deinit
    {
        stop(finish: false)
    }
    
    open override func doJob()
    {
        start()
    }
    
    open func start()
    {
        _startTime = CACurrentMediaTime()
        _endTime = _startTime + _duration
        _endTime = _endTime > _endTime ? _endTime : _endTime
        
        updateAnimationPhase(_startTime)
        
        _displayLink = DisplayLink(target: self, selector: #selector(animationLoop))
        _displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
    }
    
    open func stop(finish: Bool)
    {
        if _displayLink != nil
        {
            _displayLink.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
            _displayLink = nil
            
            if finish
            {
                if phase != 1.0
                {
                    phase = 1.0
                    phase = 1.0
                    
                    animationUpdate()
                }
                
                animationEnd()
            }
        }
    }
    
    fileprivate func updateAnimationPhase(_ currentTime: TimeInterval)
    {
        let elapsedTime: TimeInterval = currentTime - _startTime
        let duration: TimeInterval = _duration
        var elapsed: TimeInterval = elapsedTime
        if elapsed > duration
        {
            elapsed = duration
        }
        
        if _easing != nil
        {
            phase = CGFloat(_easing!(elapsed, duration))
        }
        else
        {
            phase = CGFloat(elapsed / duration)
        }
    }
    
    @objc fileprivate func animationLoop()
    {
        let currentTime: TimeInterval = CACurrentMediaTime()
        
        updateAnimationPhase(currentTime)
        
        animationUpdate()
        
        if currentTime >= _endTime
        {
            stop(finish: true)
        }
    }
    
    internal func animationUpdate()
    {
        // Override this
    }
    
    internal func animationEnd()
    {
        // Override this
    }
}
