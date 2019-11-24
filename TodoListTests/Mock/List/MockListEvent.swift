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
  var invokedAddButtonTapped = false
  var invokedAddButtonTappedCount = 0
  var invokedAddButtonTappedParameters: (view: ListViewController, Void)?
  var invokedAddButtonTappedParametersList = [(view: ListViewController, Void)]()
  func addButtonTapped(view: ListViewController) {
    invokedAddButtonTapped = true
    invokedAddButtonTappedCount += 1
    invokedAddButtonTappedParameters = (view, ())
    invokedAddButtonTappedParametersList.append((view, ()))
  }
  var invokedItemListTapped = false
  var invokedItemListTappedCount = 0
  var invokedItemListTappedParameters: (todoList: TodoList, Void)?
  var invokedItemListTappedParametersList = [(todoList: TodoList, Void)]()
  func itemListTapped(todoList: TodoList) {
    invokedItemListTapped = true
    invokedItemListTappedCount += 1
    invokedItemListTappedParameters = (todoList, ())
    invokedItemListTappedParametersList.append((todoList, ()))
  }
}
