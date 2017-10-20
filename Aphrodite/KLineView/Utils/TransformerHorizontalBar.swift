//
//  TransformerHorizontalBar.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/20.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// TransformerHorizontalBarChart
@objc(ATransformerHorizontalBar)
open class TransformerHorizontalBar: Transformer
{
    /// Prepares the matrix that contains all offsets.
    open override func prepareMatrixOffset(inverted: Bool)
    {
        if !inverted
        {
            _matrixOffset = CGAffineTransform(translationX: _viewPortHandler.offsetLeft, y: _viewPortHandler.chartHeight - _viewPortHandler.offsetBottom)
        }
        else
        {
            _matrixOffset = CGAffineTransform(scaleX: -1.0, y: 1.0)
            _matrixOffset = _matrixOffset.translatedBy(x: -(_viewPortHandler.chartWidth - _viewPortHandler.offsetRight),
                                                       y: _viewPortHandler.chartHeight - _viewPortHandler.offsetBottom)
        }
    }
}
