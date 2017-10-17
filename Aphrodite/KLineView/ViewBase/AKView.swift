//
//  AKView.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/17.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import UIKit

open class AKView: View {
    
    public final override func touchesBegan(_ touches: Set<Touch>, with event: Event?) {
        self.aTouchesBegan(touches, withEvent: event)
    }
    
    public final override func touchesMoved(_ touches: Set<Touch>, with event: Event?) {
        self.aTouchesMoved(touches, withEvent: event)
    }
    
    public final override func touchesEnded(_ touches: Set<Touch>, with event: Event?) {
        self.aTouchesEnded(touches, withEvent: event)
    }
    
    public final override func touchesCancelled(_ touches: Set<Touch>, with event: Event?) {
        self.aTouchesCancelled(touches, withEvent: event)
    }
    
    open func aTouchesBegan(_ touches: Set<Touch>, withEvent event: Event?) {
        super.touchesBegan(touches, with: event!)
    }
    
    open func aTouchesMoved(_ touches: Set<Touch>, withEvent event: Event?) {
        super.touchesMoved(touches, with: event!)
    }
    
    open func aTouchesEnded(_ touches: Set<Touch>, withEvent event: Event?) {
        super.touchesEnded(touches, with: event!)
    }
    
    open func aTouchesCancelled(_ touches: Set<Touch>?, withEvent event: Event?) {
        super.touchesCancelled(touches!, with: event!)
    }
    
    var nsuiLayer: CALayer? {
        return self.layer
    }
}
