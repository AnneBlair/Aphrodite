//
//  SetTest.swift
//  AphroditeTests
//
//  Created by Sir-Anne-Blair on 2017/11/15.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest
@testable import Aphrodite

class SetTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetAs() {
        let list: List = [1,2,3]
        list.reversed().elementsEqual(list.reversed() as [Int])
    }
}
