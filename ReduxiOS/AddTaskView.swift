//
//  AddTaskView.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: Store<AppState>
    
    @State var taskName: String = ""
    
    struct Props {
        //Prop
        var tasks: [Task]
        //dispatch
        var onTaskAdded: (Task) -> Void
    }
    
    private func mapStateToProps(_ state: TaskState) -> Props {
        Props(tasks: state.tasks,
              onTaskAdded: { task in
            store.dispatch(AddTaskAction(task: task))
        })
    }
    
    
    var body: some View {
        let props = mapStateToProps(store.state.taskState)
        VStack {
            TextField("Enter Task", text: $taskName)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Add Task") {
                props.onTaskAdded(Task(title: taskName))
                taskName = ""
            }
            List(props.tasks) { task in
                VStack {
                    Text(task.title)
                        .bold()
                }
            }
            Spacer()
        }
    }
}
