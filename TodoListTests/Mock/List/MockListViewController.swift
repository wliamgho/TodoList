//
//  MockListViewController.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListViewController: ListViewController {
  var invokedTableViewSetter = false
  var invokedTableViewSetterCount = 0
  var invokedTableView: UITableView?
  var invokedTableViewList = [UITableView?]()
  var invokedTableViewGetter = false
  var invokedTableViewGetterCount = 0
  var stubbedTableView: UITableView!
  override var tableView: UITableView! {
    set {
      invokedTableViewSetter = true
      invokedTableViewSetterCount += 1
      invokedTableView = newValue
      invokedTableViewList.append(newValue)
    }
    get {
      invokedTableViewGetter = true
      invokedTableViewGetterCount += 1
      return stubbedTableView
    }
  }
  var invokedAddBarButtonSetter = false
  var invokedAddBarButtonSetterCount = 0
  var invokedAddBarButton: UIBarButtonItem?
  var invokedAddBarButtonList = [UIBarButtonItem?]()
  var invokedAddBarButtonGetter = false
  var invokedAddBarButtonGetterCount = 0
  var stubbedAddBarButton: UIBarButtonItem!
  override var addBarButton: UIBarButtonItem! {
    set {
      invokedAddBarButtonSetter = true
      invokedAddBarButtonSetterCount += 1
      invokedAddBarButton = newValue
      invokedAddBarButtonList.append(newValue)
    }
    get {
      invokedAddBarButtonGetter = true
      invokedAddBarButtonGetterCount += 1
      return stubbedAddBarButton
    }
  }
  var invokedEventSetter = false
  var invokedEventSetterCount = 0
  var invokedEvent: ListEvent?
  var invokedEventList = [ListEvent?]()
  var invokedEventGetter = false
  var invokedEventGetterCount = 0
  var stubbedEvent: ListEvent!
  override var event: ListEvent? {
    set {
      invokedEventSetter = true
      invokedEventSetterCount += 1
      invokedEvent = newValue
      invokedEventList.append(newValue)
    }
    get {
      invokedEventGetter = true
      invokedEventGetterCount += 1
      return stubbedEvent
    }
  }
  var invokedViewWillAppear = false
  var invokedViewWillAppearCount = 0
  var invokedViewWillAppearParameters: (animated: Bool, Void)?
  var invokedViewWillAppearParametersList = [(animated: Bool, Void)]()
  override func viewWillAppear(_ animated: Bool) {
    invokedViewWillAppear = true
    invokedViewWillAppearCount += 1
    invokedViewWillAppearParameters = (animated, ())
    invokedViewWillAppearParametersList.append((animated, ()))
  }
  var invokedViewDidLoad = false
  var invokedViewDidLoadCount = 0
  override func viewDidLoad() {
    invokedViewDidLoad = true
    invokedViewDidLoadCount += 1
  }
  var invokedShowTodoList = false
  var invokedShowTodoListCount = 0
  var invokedShowTodoListParameters: (todoList: [TodoList], Void)?
  var invokedShowTodoListParametersList = [(todoList: [TodoList], Void)]()
  override func showTodoList(todoList: [TodoList]) {
    invokedShowTodoList = true
    invokedShowTodoListCount += 1
    invokedShowTodoListParameters = (todoList, ())
    invokedShowTodoListParametersList.append((todoList, ()))
  }
  var invokedAddButtonTapped = false
  var invokedAddButtonTappedCount = 0
  override func addButtonTapped() {
    invokedAddButtonTapped = true
    invokedAddButtonTappedCount += 1
  }
}
