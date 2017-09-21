//
//  ExtensionDateTest.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/21.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest

class DateTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJudgeMinuteDate() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505967000).judgeSomeMinute(date: Date(timeIntervalSince1970: 1505967011)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1505967836).judgeSomeMinute(date: Date(timeIntervalSince1970: 1505967000)))
    }
    
    func testJudgeHour() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505967836).judgeSomeHour(date: Date(timeIntervalSince1970: 1505967000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1505967000).judgeSomeHour(date: Date(timeIntervalSince1970: 150596000)))
    }
    
    func testJudgeDay() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505960000).judgeSomeDay(date: Date(timeIntervalSince1970: 1505960000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1505240000).judgeSomeDay(date: Date()))
    }
    
    func testJudgeMoon() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505960000).judgeSomeMoon(date: Date(timeIntervalSince1970: 1504960000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1502960000).judgeSomeMoon(date: Date()))
    }
    
    func testJudgeYear() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1502960000).judgeSomeYear(date: Date(timeIntervalSince1970: 1502960000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1300960000).judgeSomeYear(date: Date()))
    }
}
