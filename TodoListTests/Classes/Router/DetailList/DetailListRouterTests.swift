//
//  DetailListRouterTests.swift
//  TodoListTests
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class DetailListRouterTests: XCTestCase {
  var mockPersistentContainer: MockPersistentContainer?
  var mockCoreDataManager: MockCoreDataManager?

  var todoList: TodoList?

  var router: DetailListRouter?

  override func setUp() {
    router = DetailListRouter()
    router?.viewController
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testPerformanceExample() {
      // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
  }
}
