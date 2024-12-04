//
//  AppReducer.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

func appReducer(_ state: AppState, action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    return state
}
