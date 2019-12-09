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
    XCTAssertNil(view, "Expect list view controller init is not included NSCoder")
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

  func testShowTodoList() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                  TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.create(json: sampleData, context: context!) as? TodoList else {
     XCTFail("Failed creating TodoList Entity")
     return
    }

//    mockCoreDataManager?.stubbedCreateEntityResult = (todo)

    view?.showTodoList(todoList: [todo])
    XCTAssert(view?.tableView.numberOfSections == [todo].count, "Expect number of sections is same with todoList count")
//    XCTAssert(view?.tableView.rowHeight == 100, "Expect tableview height is 100")
  }

  func testSelectedTodoList() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                  TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.create(json: sampleData, context: context!) as? TodoList else {
     XCTFail("Failed creating TodoList Entity")
     return
    }

//    mockCoreDataManager?.stubbedCreateEntityResult = (todo)

    view?.showTodoList(todoList: [todo])
    view?.tableView(view?.tableView ?? UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

    XCTAssert(mockEvent?.invokedItemListTapped == true, "Expect item list tapped is called")
    XCTAssert(mockEvent?.invokedItemListTappedCount == 1, "Expect item list tapped is called once")
    XCTAssert(mockEvent?.invokedItemListTappedParameters?.todoList == todo, "Expect item list param value is same with todo")
    XCTAssert(mockEvent?.invokedItemListTappedParameters?.view == view, "Expect item list param value is same with view")
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }
}
