//
//  IncrementMiddleware.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as IncrementActionAsync:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatch(IncrementAction())
            }
        default:
            break
        }
    }
    
}
