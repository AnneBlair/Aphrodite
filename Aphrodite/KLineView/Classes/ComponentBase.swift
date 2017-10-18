//
//  ComponentBase.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/18.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

@objc(AComponentBase)
open class ComponentBase: NSObject {
    
    /// flag that indicates if this component is enabled or not
    open var enabled = true
    
    /// The offset this component has on the x-axis
    /// **default**: 5.0
    open var xOffset = CGFloat(5.0)
    
    /// The offset this component has on the x-axis
    /// **default**: 5.0 (or 0.0 on ChartYAxis)
    open var yOffset = CGFloat(5.0)
    
    public override init() {
        super.init()
    }
    
    open var isEnabled: Bool { return enabled }
}
