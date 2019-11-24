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
  var mockRouter: MockDetailListRouter?
  var mockView: MockDetailListView?
  var mockInteractor: MockDetailListInteractorInput?

  var presenter: DetailListPresenter?

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mockRouter = MockDetailListRouter()
    mockView = MockDetailListView()
    mockInteractor = MockDetailListInteractorInput()

    presenter = DetailListPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!)
    presenter?.view = mockView
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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
