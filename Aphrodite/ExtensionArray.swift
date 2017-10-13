//
//  ExtensionArray.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/10/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation
public extension Array {
    
    /// This function creates an intermediate variable to store the values of each step, and then uses map to gradually create the result array from this intermediate value
    ///
    /// e.g let accumulate = [1,2,3,5].accumulate(0, +)
    /// print(accumulate)   "[1, 3, 6, 11]"
    /// - Parameters:
    ///   - initialResult: Result
    ///   - nextPartialResult: (Result, Element) -> Result
    /// - Returns: [Result]
    func accumulate<Result>(_ initialResult: Result,
                            _ nextPartialResult: (Result, Element) -> Result) -> [Result]
    {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
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
    
    /// Check whether all elements in a sequence satisfy a certain condition
    /// For a condition, if no element does not satisfy it, it means that all elements satisfy it
    ///
    /// e.g： let nums = [1,2,3,4,5,6,7,8,9]
    ///       evenNums.all { $0 % 2 == 0 }   "false"
    ///
    /// - Parameter predicate: Iterator.Element
    /// - Returns: True or False
    public func all(matching predicate: (Iterator.Element) -> Bool) -> Bool {
        return !contains { !predicate($0) }
    }
}

public extension Sequence where Iterator.Element: Hashable {
    /// Gets all the unique elements in the sequence
    /// e.g: let unique = [1,2,3,4,5,6,1,1,1,1,1].unique()
    ///          print(unique)     "[1, 2, 3, 4, 5, 6]"
    ///
    /// - Returns: All the unique elements are placed in a Set, and then returned to the contents of the collection
    public func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter {
            if seen.contains($0) {
                return false
            } else {
                seen.insert($0)
                return true
            }
        }
    }
}

