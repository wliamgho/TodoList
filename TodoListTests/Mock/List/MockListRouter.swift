//
//  MockListRouter.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListRouter: ListRouter {
  var invokedPushToAddListRouter = false
  var invokedPushToAddListRouterCount = 0
  var invokedPushToAddListRouterParameters: (viewController: UIViewController?, Void)?
  var invokedPushToAddListRouterParametersList = [(viewController: UIViewController?, Void)]()
  override func pushToAddListRouter(viewController: UIViewController?) {
    invokedPushToAddListRouter = true
    invokedPushToAddListRouterCount += 1
    invokedPushToAddListRouterParameters = (viewController, ())
    invokedPushToAddListRouterParametersList.append((viewController, ()))
  }
  var invokedPresentToDetailRouter = false
  var invokedPresentToDetailRouterCount = 0
  var invokedPresentToDetailRouterParameters: (todoList: TodoList, viewController: UIViewController?)?
  var invokedPresentToDetailRouterParametersList = [(todoList: TodoList, viewController: UIViewController?)]()
  override func presentToDetailRouter(todoList: TodoList, viewController: UIViewController?) {
    invokedPresentToDetailRouter = true
    invokedPresentToDetailRouterCount += 1
    invokedPresentToDetailRouterParameters = (todoList, viewController)
    invokedPresentToDetailRouterParametersList.append((todoList, viewController))
  }
}
