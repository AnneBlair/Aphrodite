//
//  Tool.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

#if os(iOS)
    public func printDebug<T>(_ message: T,
                           file: String = #file,
                           method: String = #function,
                           line: Int = #line
        )
    {
        #if DEBUG
            print("------------------\(line) lineBegin-------------------------\nClass Name: \((file as NSString).lastPathComponent)\nMethod Name: \(method)\nMessage: \(message)\n------------------\(line) line  End-------------------------")
        #endif
    }
    
    /// 线程加锁
    ///
    /// - Parameters:
    ///   - lock: 加锁对象
    ///   - dispose: 执行闭包函数,
    public func synchronized(_ lock: AnyObject,dispose: ()->()) {
        objc_sync_enter(lock)
        dispose()
        objc_sync_exit(lock)
    }
    
    public let UIScreeWidth: CGFloat = UIScreen.main.bounds.size.width
    public let UIScreeHeight: CGFloat = UIScreen.main.bounds.size.height
    
    public let NOW_WIDTH: CGFloat = (UIScreeWidth / 375.0)
    public let NOW_HEIGHT: CGFloat = (UIScreeHeight / 667.0)
    
    
    //MARK:            延时使用        _____________________________________________________________________________
    
    public typealias TaskBlock = (_ cancel : Bool) -> Void
    
    public func delay(_ time: TimeInterval, task: @escaping ()->()) ->  TaskBlock? {
        
        func dispatch_later(block: @escaping ()->()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        
        var closure: (()->Void)? = task
        var result: TaskBlock?
        
        let delayedClosure: TaskBlock = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        return result
    }
    
    public func cancel(_ task: TaskBlock?) {
        task?(true)
    }
    
#endif
