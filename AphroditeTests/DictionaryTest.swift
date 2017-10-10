//
//  DictionaryTest.swift
//  AphroditeTests
//
//  Created by AnneBlair on 2017/10/10.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import XCTest

class DictionaryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMerge() {
        var defaultDic: [String: String] = ["Yin": "x"]
        let dic: [String: String]  = ["Yin": "Yu"]
        defaultDic.merge(dic)
        XCTAssertEqual(defaultDic, ["Yin": "Yu"])
        let otherDic = ["Yu": "Ge"]
        defaultDic.merge(otherDic)
        XCTAssertEqual(defaultDic, ["Yin": "Yu","Yu": "Ge"])
    }
    
    func testDicInit() {
        let defaultName = (1..<3).map { (key: "YinYu\($0)", value: false) }
        let nameDictionary = Dictionary(defaultName)
        XCTAssertEqual(nameDictionary, ["YinYu2": false, "YinYu1": false])
    }
    
    func testMapValues() {
        let dics = ["Yin": 66,"Yu": 99]
        let tranDic = dics.mapValues { str in
            return String(str)
        }
        XCTAssertEqual(tranDic, ["Yu": "99", "Yin": "66"])
    }
}
