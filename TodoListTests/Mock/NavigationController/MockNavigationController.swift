//
//  MockNavigationController.swift
//  TodoListTests
//
//  Created by William on 09/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

class MockNavigationController: UINavigationController {
  var invokedPushViewController: UIViewController?
  var invokedPushNavigation = false
  var invokedPushNavigationCalled = 0
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      invokedPushViewController = viewController
      invokedPushNavigation = true
      invokedPushNavigationCalled += 1
  }
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
