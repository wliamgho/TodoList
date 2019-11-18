//
//  MockAddListInteractorInput.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockAddListInteractorInput: AddListInteractorInput {
  var invokedAddTodoList = false
  var invokedAddTodoListCount = 0
  var invokedAddTodoListParameters: (data: [String: Any], Void)?
  var invokedAddTodoListParametersList = [(data: [String: Any], Void)]()
  func addTodoList(data: [String: Any]) {
    invokedAddTodoList = true
    invokedAddTodoListCount += 1
    invokedAddTodoListParameters = (data, ())
    invokedAddTodoListParametersList.append((data, ()))
  }
}
