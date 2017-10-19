//
//  Description.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
import CoreGraphics

@objc(ADescription)
open class Description: ComponentBase
{
    public override init()
    {
        #if os(tvOS)
            // 23 is the smallest recommended font size on the TV
            font = NSUIFont.systemFont(ofSize: 23)
        #elseif os(OSX)
            font = NSUIFont.systemFont(ofSize: NSUIFont.systemFontSize())
        #else
            font = Font.systemFont(ofSize: 8.0)
        #endif
        
        super.init()
    }
    
    /// The text to be shown as the description.
    open var text: String? = "Description Label"
    
    /// Custom position for the description text in pixels on the screen.
    open var position: CGPoint? = nil
    
    /// The text alignment of the description text. Default RIGHT.
    open var textAlign: NSTextAlignment = NSTextAlignment.right
    
    /// Font object used for drawing the description text.
    open var font: Font
    
    /// Text color used for drawing the description text
    open var textColor = Color.black
}
