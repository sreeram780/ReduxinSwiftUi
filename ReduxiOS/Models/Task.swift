//
//  Task.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import Foundation

struct Task: Identifiable {
    let title: String
    var id: String {
        title
    }
}
