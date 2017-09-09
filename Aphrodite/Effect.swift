//
//  Effect.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// 短震
public func shortShockEffect() {
    if #available(iOS 10.0, *) {
        let generator = UIImpactFeedbackGenerator(style: UIImpactFeedbackStyle.light)
        generator.prepare()
        generator.impactOccurred()
    } else {
        // Fallback on earlier versions
    }
}
