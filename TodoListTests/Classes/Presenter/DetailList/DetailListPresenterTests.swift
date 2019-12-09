//
//  DetailListPresenterTests.swift
//  TodoListTests
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class DetailListPresenterTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  var todoList: [TodoList]?

  var mockRouter: MockDetailListRouter?
  var mockView: MockDetailListView?
  var mockInteractor: MockDetailListInteractorInput?

  var presenter: DetailListPresenter?

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mockView = MockDetailListView()
    mockInteractor = MockDetailListInteractorInput()

    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)

    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                 TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.create(json: sampleData, context: context!) as? TodoList else {
      return
    }

    mockRouter = MockDetailListRouter(todoList: todo)
    presenter = DetailListPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!)
    presenter?.view = mockView
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }
}
