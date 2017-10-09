//
//  ExtensionArray.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
public extension Array {
    
}

public extension Sequence {

    /// In the inverted array, find the first element satisfying the specified condition
    /// var arrs = ["swift","oc","C++","Java","aa"]
    /// let last = arrs.last { $0.hasSuffix("a")}
    /// print(last)  "aa"
    /// - Parameter predicate: Iterator.Element
    /// - Returns: Element ?? nil
    public func last(where predicate: (Iterator.Element) -> Bool) -> Iterator.Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}
