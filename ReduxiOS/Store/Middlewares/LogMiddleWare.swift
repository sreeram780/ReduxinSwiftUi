//
//  LogMiddleWare.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

func logMiddleWare() -> Middleware<AppState> {
    return { state, action, next in
        print("Log middle ware")
    }
}
