//
//  ReduxiOSApp.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import SwiftUI

@main
struct ReduxiOSApp: App {
    var body: some Scene {
        let store = Store(appReducer, state: AppState(), middlewares: [logMiddleWare(), incrementMiddleware()])
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}


