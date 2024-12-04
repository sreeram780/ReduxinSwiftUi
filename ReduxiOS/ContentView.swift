//
//  ContentView.swift
//  ReduxiOS
//
//  Created by Tatiredd.reddy on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    @State var isPresenting: Bool = false
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
        let onIncrementAsync: () -> Void


    }
    
    private func mapStateToProps(_ state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(IncrementAction())
        }, onDecrement: {
            store.dispatch(DecrementAction())
        }, onAdd: {
            store.dispatch(AddAction(value: $0))
        }, onIncrementAsync: {
            store.dispatch(IncrementActionAsync())
        })
    }
    
    var body: some View {
        let props = mapStateToProps(store.state.counterState)
        
        VStack {
            Spacer()
            Text("\(props.counter)").padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(10)
            }
            
            Button("incremenrt async") {
                props.onIncrementAsync()
            }
            
            Spacer()
            Button("Add Task") {
                isPresenting = true
            }
            Spacer()
        }.sheet(isPresented: $isPresenting) {
            AddTaskView().environmentObject(store)
        }
    }
}

//#Preview {
//    ContentView()
//}
