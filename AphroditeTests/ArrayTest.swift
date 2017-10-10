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
    
    func testAccumlate() {
        let arrs: [Int] = [1,2,3,5]
        XCTAssertEqual(arrs.accumulate(0, +), [1,3,6,11])
    }
    
    func testAll() {
        let nums = [1,2,3,4,5,6,7,8,9]
        XCTAssertEqual(nums.all { $0 % 2 == 0 }, false)
        let filNums = nums.filter { $0 % 2 == 0 }
        XCTAssertEqual(filNums.all { $0 % 2 == 0 }, true)
    }
    
    func testLast() {
        let arrs = ["swift","oc","c++","Java","aa"]
        XCTAssertEqual(arrs.last { $0.hasSuffix("a") }, arrs.last)
        XCTAssertEqual(arrs.last { $0.hasSuffix("1") }, nil)
        XCTAssertEqual(arrs.last { $0.hasPrefix("o") }, "oc")
        XCTAssertEqual(arrs.last { $0.hasPrefix("f") }, nil)
    }
}
