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
    
    func testJudgeWeek() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505987307).judgeSomeWeek(date: Date(timeIntervalSince1970: 1505997448)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1505997448).judgeSomeWeek(date: Date(timeIntervalSince1970: 1504960000)))
    }
    
    func testjudgeMonth() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1505960000).judgeSomeMonth(date: Date(timeIntervalSince1970: 1504960000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1502960000).judgeSomeMonth(date: Date()))
    }
    
    func testJudgeYear() {
        XCTAssertTrue(Date(timeIntervalSince1970: 1502960000).judgeSomeYear(date: Date(timeIntervalSince1970: 1502960000)))
        XCTAssertFalse(Date(timeIntervalSince1970: 1300960000).judgeSomeYear(date: Date()))
    }

    func testMinute() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.minute, 0)
        date.minute = 1
        XCTAssertFalse(date.minute != 1)
    }
    
    /// "Jan 1, 1970, 8:00 AM"
    func testHour() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.hour, 8)
        date.hour = 1
        XCTAssertFalse(date.hour != 1)
    }
    
    func testDay() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.day, 1)
        date.day = 2
        XCTAssertFalse(date.day != 2)
    }
    
    func testWeek() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.week, 5)
        date.week = 6
        XCTAssertFalse(date.week != 6)
    }
    
    func testMonth() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.month, 1)
        date.month = 2
        XCTAssertFalse(date.month != 2)
    }
    
    func testYear() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.year, 1970)
        date.year = 2017
        XCTAssertFalse(date.year != 2017)
    }
}














