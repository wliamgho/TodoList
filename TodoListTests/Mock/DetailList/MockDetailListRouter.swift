//
//  MockDetailListRouter.swift
//  TodoListTests
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockDetailListRouter: DetailListRouter {
  var invokedViewControllerGetter = false
  var invokedViewControllerGetterCount = 0
  var stubbedViewController: UIViewController!
  override var viewController: UIViewController {
    invokedViewControllerGetter = true
    invokedViewControllerGetterCount += 1
    return stubbedViewController
  }
}
