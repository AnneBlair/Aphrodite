//
//  ExtensionText.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

/// Seting AttributedString
///
/// - Parameters:
///   - color: 颜色 Arry [[Ox000000],[Ox000000]]
///   - content: 内容 Arry ["第一个"，"第二个"]
///   - size: 字体 Arry  [size1,size2]
/// - Returns: 富文本
//public func setAttribute(color: [[Int]],content:[String],size: [CGFloat])-> NSMutableAttributedString {
//    let str = NSMutableAttributedString()
//    for i in 0..<color.count {
//        str.append(NSAttributedString(string: content[i], attributes: [.foregroundColor: UIColor(hex: color[i][0]), .font:UIFont.systemFont(ofSize: size[i])]))
//    }
//    return str
//}

/// scientific Notation Transition Normal String
/// 9.0006e+07  Transition   90,006,000
/// - Parameter f_loat: Input
/// - Returns: Output
public func inputFOutputS(f_loat: Double) -> String {
    let numFormat = NumberFormatter()
    numFormat.numberStyle = NumberFormatter.Style.decimal
    let num = NSNumber.init(value: f_loat)
    return numFormat.string(from: num)!
}

// MARK: - 数字转换成字符串金额   11121.01   -> "11,121.01"  三位一个逗号
extension NSNumber {
    var dollars: String {
        let formatter: NumberFormatter = NumberFormatter()
        var result: String?
        formatter.numberStyle = NumberFormatter.Style.decimal
        result = formatter.string(from: self)
        if result == nil {
            return "error"
        }
        return result!
    }
}

extension String {
    
    /// Converting an array of strings by iterator
    /// e.g: "YinYu".stringToArr()   "["Y", "i", "n", "Y", "u"]"
    ///
    /// - Returns: [String]
    public func stringToArr() -> [String] {
        return PrefixSequence(string: self).map { $0 }
    }
    
    /// Converts an array of uppercase strings into iterators
    /// e.g: "YinYu".uppercasedArr()   "["Y", "I", "N", "Y", "U"]"
    ///
    /// - Returns: [String]
    public func uppercasedArr() -> [String] {
        return PrefixSequence(string: self).map { $0.uppercased() }
    }
    
    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
//    public func stringCut(end: Int) ->String{
//        guard self.startIndex < self.endIndex else { return "截取超出范围" }
//        let str = prefix(upTo: index(startIndex, offsetBy: end))
//        return String(str)
//    }
    
    /// 截取人任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
//    public func stringCutToEnd(star: Int) -> String {
//        guard self.startIndex < self.endIndex else { return "截取超出范围" }
//        let start = index(startIndex, offsetBy: star)
//        return String(describing: [start...])
//    }
    
    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    public func stringInsert(content: String,locat: Int) -> String {
        guard self.startIndex < self.endIndex else { return "截取超出范围" }
        let str1 = stringCut(end: locat)
        let str2 = stringCutToEnd(star: locat)
        return str1 + content + str2
    }
    
    /// 计算字符串宽高
    ///
    /// - Parameter size: size
    /// - Returns: CGSize
//    public func getStringSzie(size: CGFloat = 10) -> CGSize {
//        let baseFont = UIFont.systemFont(ofSize: size)
//        let size = self.size(withAttributes: [NSAttributedStringKey.font: baseFont])
//        let width = ceil(size.width) + 5
//        let height = ceil(size.height)
//        return CGSize(width: width, height: height)
//    }
    
    /// 字符串截取         3  6
    /// e.g let aaa = "abcdefghijklmnopqrstuvwxyz"  -> "cdef"
    /// - Parameters:
    ///   - start: 开始位置 3
    ///   - end: 结束位置 6
    /// - Returns: 截取后的字符串 "cdef"
//    public func startToEnd(start: Int,end: Int) -> String {
//        if !(end < self.count) || start > end { return "取值范围错误" }
//        var tempStr: String = ""
//        for i in start...end {
//            let temp: String = self[self.index(self.startIndex, offsetBy: i - 1)].description
//            tempStr += temp
//        }
//        return tempStr
//    }
    
    /// 字符URL格式化
    ///
    /// - Returns: 格式化的 url
    public func stringEncoding() -> String {
        let url = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return url!
    }
}

//MARK:            ________________IteratorProtocol________________
public struct PrefixIterator: IteratorProtocol {
    let string: String
    var offset: String.Index
    init(string: String) {
        self.string = string
        offset = string.startIndex
    }
    mutating public func next() -> String? {
        guard offset < string.endIndex else { return nil }
        let previous = offset
        offset = string.index(after: offset)
        return String(string[previous..<offset])
    }
}

public struct PrefixSequence: Sequence {
    let string: String
    public func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}
