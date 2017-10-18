//
//  Renderer.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/19.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

@objc(ARenderer)
open class Renderer: NSObject
{
    /// the component that handles the drawing area of the chart and it's offsets
    open var viewPortHandler: PortHandler?
    
    public override init() {
        super.init()
    }
    
    public init(viewPortHandler: PortHandler?) {
        super.init()
        self.viewPortHandler = viewPortHandler
    }
}
