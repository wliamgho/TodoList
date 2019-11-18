//
//  MockListInteractorOutput.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListInteractorOutput: ListInteractorOutput {
  var invokedGetTodoList = false
  var invokedGetTodoListCount = 0
  var invokedGetTodoListParameters: (todo: [TodoList], Void)?
  var invokedGetTodoListParametersList = [(todo: [TodoList], Void)]()
  func getTodoList(todo: [TodoList]) {
    invokedGetTodoList = true
    invokedGetTodoListCount += 1
    invokedGetTodoListParameters = (todo, ())
    invokedGetTodoListParametersList.append((todo, ()))
  }
}
