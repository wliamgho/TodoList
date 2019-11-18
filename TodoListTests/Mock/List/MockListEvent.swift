//
//  MockListEvent.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListEvent: ListEvent {
  var invokedFetchTodoList = false
  var invokedFetchTodoListCount = 0
  func fetchTodoList() {
    invokedFetchTodoList = true
    invokedFetchTodoListCount += 1
  }
}
