//
//  ArrayTest.swift
//  AphroditeTests
//
//  Created by AnneBlair on 2017/10/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest

class ArrayTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLast() {
        let arrs = ["swift","oc","c++","Java","aa"]
        XCTAssertEqual(arrs.last { $0.hasSuffix("a") }, arrs.last)
        XCTAssertEqual(arrs.last { $0.hasSuffix("1") }, nil)
        XCTAssertEqual(arrs.last { $0.hasPrefix("o") }, "oc")
        XCTAssertEqual(arrs.last { $0.hasPrefix("f") }, nil)
    }
}
