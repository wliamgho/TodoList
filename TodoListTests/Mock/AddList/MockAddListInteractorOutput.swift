//
//  MockAddListInteractorOutput.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockAddListInteractorOutput: AddListInteractorOutput {
  var invokedFailedToAddNewList = false
  var invokedFailedToAddNewListCount = 0
  var invokedFailedToAddNewListParameters: (errMessage: String, Void)?
  var invokedFailedToAddNewListParametersList = [(errMessage: String, Void)]()
  func failedToAddNewList(errMessage: String) {
    invokedFailedToAddNewList = true
    invokedFailedToAddNewListCount += 1
    invokedFailedToAddNewListParameters = (errMessage, ())
    invokedFailedToAddNewListParametersList.append((errMessage, ()))
  }
  var invokedAddedNewList = false
  var invokedAddedNewListCount = 0
  var invokedAddedNewListParameters: (todoList: TodoList, Void)?
  var invokedAddedNewListParametersList = [(todoList: TodoList, Void)]()
  func addedNewList(todoList: TodoList) {
    invokedAddedNewList = true
    invokedAddedNewListCount += 1
    invokedAddedNewListParameters = (todoList, ())
    invokedAddedNewListParametersList.append((todoList, ()))
  }
}
