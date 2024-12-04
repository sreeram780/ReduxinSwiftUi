//
//  Store.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation
import SwiftUI

typealias Dispatcher = (Action) -> Void
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void
typealias Reducer<State: ReduxState> = (_ state: State , _ action: Action) -> State

protocol ReduxState { }
protocol Action { }

struct AppState: ReduxState {
    var counterState =  CounterState()
    var taskState = TaskState()
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}


struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct IncrementActionAsync: Action { }

struct AddAction: Action {
    let value: Int
}

struct AddTaskAction: Action {
    let task: Task
}

struct GetMoviesAction: Action {
    var movies = [String]()
}



class Store<StoreState: ReduxState>: ObservableObject {
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    init(_ reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        middlewares.forEach { middleWare in
            middleWare(state, action, dispatch)
        }
    }
}
