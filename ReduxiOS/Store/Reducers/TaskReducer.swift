//
//  TaskReducer.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    return state
}
