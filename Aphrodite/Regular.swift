//
//  Regular.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public struct RegexHelper {
    
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
}

precedencegroup MatchPrecedence {

    associativity: none

    higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

public func =~(object: String, template: String) -> Bool {
    do {
        return try RegexHelper(template).match(object)
    } catch _ {
        return false
    }
}

/// 邮箱匹配
public let mail: String = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

/// 匹配用户名 字母或者数字组合 4到16位
public let Username: String = "^[a-z0-9_-]{4,16}$"

/// 匹配密码 字母加下划线，6到18位
public let Password: String = "^[a-z0-9_-]{6,18}$"

/// 匹配16进制
public let HexValue: String = "^#?([a-f0-9]{6}|[a-f0-9]{3})$"

///内容带分割符号 “Anne-Blair”
public let Slug: String = "^[a-z0-9-]+$"

/// 匹配 HTPPS URL
public let isURL: String = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

/// 匹配IP地址
public let IPAddress: String = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

/// 是HTML <center>内容<\center>  符合
public let HTMLTag: String = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"

/// 日期(年-月-日)
public let isDate1: String = "(\\d{4}|\\d{2})-((1[0-2])|(0?[1-9]))-(([12][0-9])|(3[01])|(0?[1-9]))"

/// 日期(月/日/年)
public let isDate2: String = "((1[0-2])|(0?[1-9]))/(([12][0-9])|(3[01])|(0?[1-9]))/(\\d{4}|\\d{2})"

/// 是汉字
public let isChinese: String = "[\\u4e00-\\u9fa5]"

/// 中文及全角标点符号(字符)
public let ChineseParagraph: String = "[\\u3000-\\u301e\\ufe10-\\ufe19\\ufe30-\\ufe44\\ufe50-\\ufe6b\\uff01-\\uffee]"

/// 手机号 ps:因为大陆手机号分联通移动等等没法用一个表示出来
public let isPhoneNum: String = "^1[0-9]{10}$"


