//
//  AddListInteractorTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class AddListInteractorTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  var mockOutput: MockAddListInteractorOutput?
  var interactor: AddListInteractor?

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mockPersistentContainer = MockPersistentContainer()
    mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer!.container)

    mockOutput = MockAddListInteractorOutput()
    interactor = AddListInteractor(coreDataManager: mockCoreDataManager!)
    interactor?.output = mockOutput
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
    mockCoreDataManager?.deleteData(TodoList.entityName())
  }

  func testFailedCreateNewEntity() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                 TodoListKey.title.rawValue: "Test"]

    mockCoreDataManager?.createEntity(ofType: TodoList.self, withData: [:])

    interactor?.addTodoList(data: [:])
    XCTAssert(mockOutput?.invokedFailedToAddNewList == true, "Expect failed to add new list is called")
    XCTAssert(mockOutput?.invokedFailedToAddNewListCount == 1, "Expect failed to add new list is called once")
    XCTAssert(mockOutput?.invokedFailedToAddNewListParameters?.errMessage == "Invalid add new list", "Expect failed to add new list with error message `Invalid add new list`")
  }

  func testAddNewList() {
    let id: Int64 = 1
    let sampleData: [String: Any] = [TodoListKey.id.rawValue: id,
                                  TodoListKey.title.rawValue: "Test"]
    guard let todo = mockCoreDataManager?.createEntity(ofType: TodoList.self,
                                                       withData: sampleData) as? TodoList else {
      return
    }

    interactor?.addTodoList(data: sampleData)

    mockCoreDataManager?.saveContext()

    XCTAssert(mockOutput?.invokedAddedNewList == true, "Expect added new list is called")
    XCTAssert(mockOutput?.invokedAddedNewListCount == 1, "Expect added new list is called once")
    XCTAssert(mockOutput?.invokedAddedNewListParameters?.todoList.same(entity: todo) == true, "Expect add new list param is same with todo")
  }

  func testPerformanceExample() {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }
}
