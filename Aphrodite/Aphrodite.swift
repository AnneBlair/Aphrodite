//
//  Aphrodite.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/8.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//
#if os(macOS)
    import Cocoa
#elseif os(watchOS)
    import WatchKit
#else
    import UIKit
#endif

#if os(macOS)
    import AppKit
    public typealias Image = NSImage
    public typealias View = NSView
    public typealias Color = NSColor
    public typealias ImageView = NSImageView
    public typealias Button = NSButton
#else
    import UIKit
    public typealias Image = UIImage
    public typealias ImageView = UIImageView
    public typealias Color = UIColor
    public typealias View = UIView
#endif



