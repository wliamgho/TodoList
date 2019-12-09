//
//  MockViewController.swift
//  TodoListTests
//
//  Created by William on 09/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockViewController: UIViewController {
  var invokedPresentViewController: UIViewController?
  var invokedPresentNavigation = false
  var invokedPresentNavigationCalled = 0
  override func present(_ viewControllerToPresent: UIViewController,
                        animated flag: Bool, completion: (() -> Void)? = nil) {
    invokedPresentViewController = viewControllerToPresent
    invokedPresentNavigation = true
    invokedPresentNavigationCalled += 1
  }
}
