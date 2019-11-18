//
//  ListInteractorTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class ListInteractorTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?
  var mockOutput: MockListInteractorOutput?
  var interactor: ListInteractor?

  override func setUp() {
      // Put setup code here. This method is called before the invocation of each test method in the class.
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)
    mockOutput = MockListInteractorOutput()

    interactor = ListInteractor(coreDataManager: mockCoreDataManager!)
    interactor?.output = mockOutput
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testFetchTodoList() {
    guard let todo = mockCoreDataManager?.fetch(ofType: TodoList.self) as? [TodoList] else {
      XCTFail("Failed creating TodoList Entity")
      return
    }

    interactor?.fetchTodoList()

    XCTAssert(mockOutput?.invokedGetTodoList == true, "Expect get todo list is called")
    XCTAssert(mockOutput?.invokedGetTodoListCount == 1, "Expect get todo list is called once")
    XCTAssert(mockOutput?.invokedGetTodoListParameters?.todo == todo, "Expect get todo list param is same with todo")
//    XCTAssert(mockOutput?.invokedGetTodoListParameters?.todo.contains(todoList) ?? false, "Expect get todo list param contains todoList")
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
}
