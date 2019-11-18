//
//  MockListView.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListView: ListView {
  var invokedShowTodoList = false
  var invokedShowTodoListCount = 0
  var invokedShowTodoListParameters: (todoList: [TodoList], Void)?
  var invokedShowTodoListParametersList = [(todoList: [TodoList], Void)]()
  func showTodoList(todoList: [TodoList]) {
    invokedShowTodoList = true
    invokedShowTodoListCount += 1
    invokedShowTodoListParameters = (todoList, ())
    invokedShowTodoListParametersList.append((todoList, ()))
  }
}
