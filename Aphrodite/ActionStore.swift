//
//  ActionStore.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public protocol ActionType {}
public protocol StateType {}
public protocol CommandType {}

public class Store<A: ActionType, S: StateType, C: CommandType> {
    
    public let reducer: (_ state: S, _ action: A) -> (S, C?)
    public var subscriber: ((_ state: S, _ previousState: S, _ command: C?) -> Void)?
    public var state: S
    
    init(reducer: @escaping (S, A) -> (S, C?), initialState: S) {
        self.reducer = reducer
        self.state = initialState
    }
    
    public func subscribe(_ handler: @escaping (S, S, C?) -> Void) {
        self.subscriber = handler
    }
    
    public func unsubscribe() {
        self.subscriber = nil
    }
    
    public func dispatch(_ action: A) {
        let previousState = state
        let (nextState, command) = reducer(state, action)
        state = nextState
        subscriber?(state, previousState, command)
    }
}
