//
//  MockAddListEvent.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockAddListEvent: AddListEvent {
  var invokedAddListTapped = false
  var invokedAddListTappedCount = 0
  var invokedAddListTappedParameters: (data: [String: Any], Void)?
  var invokedAddListTappedParametersList = [(data: [String: Any], Void)]()
  func addListTapped(data: [String: Any]) {
    invokedAddListTapped = true
    invokedAddListTappedCount += 1
    invokedAddListTappedParameters = (data, ())
    invokedAddListTappedParametersList.append((data, ()))
  }
}
