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
    
    func testToday() {
        XCTAssertTrue(Date().isToday)
        XCTAssertFalse(Date(timeIntervalSince1970: 0).isToday)
    }
    
    func testTomorrow() {
        var date = Date()
        date.add(.day, value: 1)
        XCTAssertTrue(date.isTomorrow)
        XCTAssertFalse(Date(timeIntervalSince1970: 0).isTomorrow)
    }
    
    func testYesterday() {
        var date = Date()
        date.add(.day, value: -1)
        XCTAssertTrue(date.isYesterday)
        XCTAssertFalse(Date(timeIntervalSince1970: 0).isYesterday)
    }
    
    func testWeekend() {
        /// 1506132061 是周末  2017-09-23 10:1:1
        let date = Date(timeIntervalSince1970: 1506132061)
        XCTAssertTrue(date.isWeekend)
        XCTAssertFalse(Date(timeIntervalSince1970: 0).isWeekend)
    }
    
    func testAdd() {
        var date = Date()
        date.add(.day, value: 1)
        XCTAssertTrue(date.isTomorrow)
        date.add(.year, value: 1)
        XCTAssertEqual(date.year, Date().year + 1)
    }

    /// Jan 1, 1970, 08:00 AM
    func testMinute() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.minute, 0)
        date.minute = 1
        XCTAssertFalse(date.minute != 1)
    }
    
    func testHour() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.hour, 8)
        date.hour = 1
        XCTAssertNotEqual(date.week, 7)
    }
    
    func testDay() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.day, 1)
        date.day = 2
        XCTAssertFalse(date.day != 2)
    }
    
    func testWeekDay() {
        // 1506823261 2017年10月1日 星期日 是 1
        let date = Date(timeIntervalSince1970: 1506823261)
        XCTAssertEqual(date.weekDay, 1)
        XCTAssertNotEqual(date.weekDay, 2)
    }
    
    func testWeek() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.week, 5)
        date.week = 6
        XCTAssertNotEqual(date.week, 7)
    }
    
    func testWeekForYear() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.weekForYear, 1)
        date.weekForYear = 40
        XCTAssertNotEqual(date.weekForYear, 41)
    }
    
    func testMonth() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.month, 1)
        date.month = 2
        XCTAssertNotEqual(date.week, 7)
    }
    
    func testYear() {
        var date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(date.year, 1970)
        date.year = 2017
        XCTAssertFalse(date.year != 2017)
    }
    
    func testDayForMonth() {
        let date = Date().dayForMonth
        XCTAssertEqual(date.month, Date().month - 1)
        XCTAssertEqual(date.hour, 23)
        XCTAssertEqual(date.minute, 59)
    }
    
    func testDayForWeek() {
        let date = Date().dayForWeek
        XCTAssertEqual(date.week, Date().dayForWeek.week)
        XCTAssertEqual(date.hour, 23)
        XCTAssertEqual(date.minute, 59)
    }
}







