//
//  RegularTest.swift
//  AphroditeTests
//
//  Created by AnneBlair on 2017/9/10.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest
@testable import Aphrodite

class RegularTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMail() {
        XCTAssertTrue("sirBlair@gmail.com" =~ mail)
        XCTAssertFalse("@gmail.com" =~ mail)
        XCTAssertFalse("sir@" =~ mail)
        XCTAssertFalse("sirBliargmail" =~ mail)
    }
    
    func testUserName() {
        XCTAssertTrue("user" =~ Username)
        XCTAssertTrue("UserName_" =~ Username)
        XCTAssertTrue("UserName_12" =~ Username)
        XCTAssertTrue("UserName12" =~ Username)
        
        XCTAssertFalse("use" =~ Username)
        XCTAssertFalse("abcdefghijklmnopqrstuvwxyz" =~ Username)
    }
    
    func testPassword() {
        XCTAssertTrue("Password" =~ Password)
        XCTAssertTrue("Password_" =~ Password)
        XCTAssertTrue("Password_as" =~ Password)
        XCTAssertTrue("123456" =~ Password)
        
        XCTAssertFalse("passw" =~ Password)
        XCTAssertFalse("12345" =~ Password)
        XCTAssertFalse("abcdefghijklmnopqrstuvwxyz" =~ Password)
    }
    
    func testHexValue() {
        XCTAssertTrue("AAA" =~ HexValue)
        XCTAssertTrue("AAA123" =~ HexValue)
        XCTAssertTrue("A2A123" =~ HexValue)
        XCTAssertFalse("1234" =~ HexValue)
    }
    
    func testSlug() {
        XCTAssertTrue("Anne-Blair" =~ Slug)
        XCTAssertTrue("Anne-" =~ Slug)
        XCTAssertFalse("Anne Blair" =~ Slug)
    }
    
    func testIsURL() {
        XCTAssertTrue("https://baike.baidu.com" =~ isURL)
        XCTAssertFalse("https://s" =~ isURL)
        XCTAssertFalse("https://" =~ isURL)
        XCTAssertFalse("http://" =~ isURL)
    }
    
    func testIpAddress() {
        XCTAssertTrue("192.168.1.1" =~ IPAddress)
        
        XCTAssertFalse("192.168.2" =~ IPAddress)
        XCTAssertFalse("122.123.12.3333" =~ IPAddress)
        XCTAssertFalse("1233.12.12.0" =~ IPAddress)
        XCTAssertFalse("0000.0.0.0" =~ IPAddress)
    }
    
    func testHtmlTag() {
        XCTAssertTrue("<tbody>ss</tbody>" =~ HTMLTag)
        XCTAssertTrue("<center>ss</center>" =~ HTMLTag)
    }
    
    func testRegular() {
        XCTAssertTrue("username" =~ Username)
        XCTAssertTrue("username_" =~ Username)
        XCTAssertTrue("username_123" =~ Username)
        XCTAssertTrue("username12__" =~ Username)
        XCTAssertTrue("password" =~ Password)
    }
}
