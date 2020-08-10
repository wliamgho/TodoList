//
//  ListViewModelState.swift
//  TodoList
//
//  Created by William on 06/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

// TODOs: - Generic Result within loading state
enum TodoListViewModelLoading {
  case screen
  case none
}

struct TodoListViewModelState {
  indirect enum State {
//    case loading(state: TodoListViewModelLoading)
//    case success(T)
//    case failed(Error)
  }

  indirect enum Value<T> {
    case fetch(Result<T, Error>)
  }

  var value: Value<AnyObject>
  var state: State

  mutating func loadValue(withValue value: Value<AnyObject>) {
    self.value = value
  }
}
