//
//  TodoTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class TodoTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  override func setUp() {
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testParseIntoTodoEntity() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                 TodoListKey.title.rawValue: "Test"]
    let context = mockPersistentContainer?.container.viewContext

    guard let todo = TodoList.parse(json: sampleData, context: context!) as? TodoList else {
      XCTFail("Failed creating TodoList Entity")
      return
    }

    XCTAssert(todo.id == 1, "Expect id value is 1")
    XCTAssert(todo.title == "Test", "Expect title value is Test")
  }

  func testUpdateEntity() {
    let id: Int64 = 1
    let data: [String: Any] = [:]
    let context = mockPersistentContainer?.container.viewContext
    guard let todo = TodoList.parse(json: data, context: context!) as? TodoList else {
      XCTFail("Failed creating TodoList Entity")
      return
    }

    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                     TodoListKey.title.rawValue: "test 123"]
    todo.update(json: sampleData)

    XCTAssert(todo.id == 1, "Expect id value is 1")
    XCTAssert(todo.title == "test 123", "Expect title value is test 123")
  }
  
  func testPerformanceExample() {
    self.measure {
    }
  }
}
