//
//  ToolTest.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/10.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest
@testable import Aphrodite

class ToolTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDebugPrint() {
        
    }
    
    func testSynchronized() {

    }
    
    func testScree() {
        XCTAssertEqual(UIScreeWidth, UIScreen.main.bounds.size.width)
    }
    
}
