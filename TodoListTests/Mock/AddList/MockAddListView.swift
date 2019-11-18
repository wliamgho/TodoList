//
//  MockAddListView.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockAddListView: AddListView {
  var invokedShowInformation = false
  var invokedShowInformationCount = 0
  var invokedShowInformationParameters: (withMessage: String, Void)?
  var invokedShowInformationParametersList = [(withMessage: String, Void)]()
  func showInformation(withMessage: String) {
    invokedShowInformation = true
    invokedShowInformationCount += 1
    invokedShowInformationParameters = (withMessage, ())
    invokedShowInformationParametersList.append((withMessage, ()))
  }
}
