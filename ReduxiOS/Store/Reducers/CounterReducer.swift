//
//  CounterReducer.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        if state.counter <= 0 {
            state.counter = 0
        } else {
            state.counter -= 1
        }
    case let action as AddAction:
        state.counter += action.value
    default:
        break
    }
    return state
}
