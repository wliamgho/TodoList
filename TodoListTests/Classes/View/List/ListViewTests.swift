//
//  ListViewTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class ListViewTests: XCTestCase {
  var mockEvent: MockListEvent?
  var view: ListViewController?

  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  override func setUp() {
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)

    mockEvent = MockListEvent()

    view = ListViewController()
    view?.event = mockEvent
  }

  override func tearDown() {
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testInitWithCoder() {
    let view = ListViewController(coder: NSCoder())
    XCTAssertNil(view, "Expect list view controller init is not with NSCoder")
  }

  func testFetchTodoList() {
    view?.viewWillAppear(false)

    XCTAssert(mockEvent?.invokedFetchTodoList == true, "Expect fetch todo list is called")
    XCTAssert(mockEvent?.invokedFetchTodoListCount == 1, "Expect fetch todo list is called once")
  }

  func testAddListTapped() {
    view?.addButtonTapped()

    XCTAssert(mockEvent?.invokedAddButtonTapped == true, "Expect add button is called")
    XCTAssert(mockEvent?.invokedAddButtonTappedCount == 1, "Expect add button is called once")
    XCTAssert(mockEvent?.invokedAddButtonTappedParameters?.view == view, "Expect add button param is ListViewController")
  }

  func testPerformanceExample() {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }
}
