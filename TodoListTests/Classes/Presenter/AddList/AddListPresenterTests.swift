//
//  AddListPresenterTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class AddListPresenterTests: XCTestCase {
  var mockView: MockAddListView?
  var mockInteractor: MockAddListInteractorInput?
  var mockRouter: MockAddListRouter?

  var presenter: AddListPresenter?
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  override func setUp() {
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)

    mockView = MockAddListView()
    mockInteractor = MockAddListInteractorInput()
    mockRouter = MockAddListRouter()

    presenter = AddListPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!)
    presenter?.view = mockView
  }

  override func tearDown() {
  }

  func testAddTodoList() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                 TodoListKey.title.rawValue: "Test"]

    presenter?.addListTapped(data: sampleData)

    XCTAssert(mockInteractor?.invokedAddTodoList == true, "Expect add todo list is called")
    XCTAssert(mockInteractor?.invokedAddTodoListCount == 1, "Expect add todo list is called once")
    XCTAssert(mockInteractor?.invokedAddTodoListParameters?.data["id"] != nil, "Expect add todo list param contain id")
    XCTAssert(mockInteractor?.invokedAddTodoListParameters?.data["title"] as? String == "Test", "Expect add todo list param contain title")
  }

  func testFailedAddListEntityWithMessage() {
    presenter?.failedToAddNewList(errMessage: "Invalid add new list")

    XCTAssert(mockView?.invokedShowInformation == true, "Expect show invalid add list is called")
    XCTAssert(mockView?.invokedShowInformationCount == 1, "Expect show invalid add list is called once")
    XCTAssert(mockView?.invokedShowInformationParameters?.withMessage == "Invalid add new list" , "Expect show invalid add list params message is `invalid add new list`")
  }

  func testSuccessAddListEntity() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                 TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.create(json: sampleData, context: context!) as? TodoList else {
      XCTFail("Failed creating TodoList Entity")
      return
    }

    presenter?.addedNewList(todoList: todo)

    XCTAssert(mockView?.invokedShowInformation == true, "Expect show success add new list is called")
    XCTAssert(mockView?.invokedShowInformationCount == 1, "Expect show success add new list is called once")
    XCTAssert(mockView?.invokedShowInformationParameters?.withMessage == "Success add new list: \(todo.title ?? "")" , "Expect show success add list params with message ")
  }

  func testPerformanceExample() {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }

}
