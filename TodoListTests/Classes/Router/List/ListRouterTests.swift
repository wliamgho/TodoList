//
//  ListRouterTests.swift
//  TodoListTests
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class ListRouterTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  var router: ListRouter?

  override func setUp() {
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)

    router = ListRouter()
  }

  override func tearDown() {
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testPushToAddListRouter() {
    let mockNavigation = MockNavigationController(rootViewController: UIViewController())

    router?.pushToAddListRouter(viewController: UIViewController())

    XCTAssert(mockNavigation.invokedPushNavigation == true, "Expect push navigation is called")
    XCTAssert(mockNavigation.invokedPushNavigationCalled == 1, "Expect push navigation is called once")
  }

  func testPresentToDetailListRouter() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                  TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.create(json: sampleData, context: context!) as? TodoList else {
     return
    }

//    mockCoreDataManager?.stubbedCreateEntityResult = (todo)

    let mockDetailListRouter = MockDetailListRouter(todoList: todo)
    router?.presentToDetailRouter(todoList: todo, viewController: UIViewController())
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }
}
