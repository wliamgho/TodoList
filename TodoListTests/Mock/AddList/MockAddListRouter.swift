//
//  MockAddListRouter.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockAddListRouter: AddListRouter {
  var invokedViewControllerGetter = false
  var invokedViewControllerGetterCount = 0
  var stubbedViewController: UIViewController!
  override var viewController: UIViewController {
    invokedViewControllerGetter = true
    invokedViewControllerGetterCount += 1
    return stubbedViewController
  }
}
