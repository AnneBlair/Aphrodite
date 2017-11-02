//
//  ChainSet.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/11/2.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

fileprivate enum ListNode<Element> {
    case end
    indirect case node(Element, next: ListNode<Element>)
    
    func cons(_ x: Element) -> ListNode<Element> {
        return .node(x, next: self)
    }
}

public struct ListIndex<Element>: CustomStringConvertible {
    fileprivate let node: ListNode<Element>
    fileprivate let tag: Int
    
    public var description: String {
        return "ListIndex((\(tag))"
    }
}

extension ListIndex: Comparable {
    public static func == <T>(lhs: ListIndex<T>,rhs: ListIndex<T>) -> Bool {
        return lhs.tag == rhs.tag
    }
    
    public static func <<T>(lhs: ListIndex<T>,rhs: ListIndex<T>) -> Bool {
        return lhs.tag > rhs.tag
    }
}

public struct List<Element>: Collection {
    
    public typealias Index = ListIndex<Element>
    
    public let startIndex: Index
    
    public let endIndex: Index
    
    public subscript(position: Index) -> Element {
        switch position.node {
        case .end: fatalError("Subscript out of range")
        case let .node(x, _): return x
        }
    }
    
    public func index(after idx: Index) -> Index {
        switch idx.node {
        case .end: fatalError("Subscript out of range")
        case let .node(_, next): return Index(node: next, tag: idx.tag - 1)
        }
    }
}

extension List: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        startIndex = ListIndex(node: elements.reversed().reduce(.end) {
            partiaList, element in
            partiaList.cons(element)
        }, tag: elements.count)
        
        endIndex = ListIndex(node: .end, tag: 0)
    }
}

extension List: CustomStringConvertible {
    public var description: String {
        let elements = self.map { String(describing: $0) }.joined(separator: ",")
        return "List:(\(elements))"
    }
}

extension List {
    public var count: Int {
        return startIndex.tag - endIndex.tag
    }
}

