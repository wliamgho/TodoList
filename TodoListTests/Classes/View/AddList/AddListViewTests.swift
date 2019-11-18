//
//  AddListViewTests.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class AddListViewTests: XCTestCase {

  var mockEvent: MockAddListEvent?
  var view: AddListViewController?

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mockEvent = MockAddListEvent()
    view = AddListViewController()
    view?.event = mockEvent
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    mockEvent = nil
  }

  func testInitWithCoder() {
    let view = AddListViewController(coder: NSCoder())
    XCTAssertNil(view, "Expect add list view controller init is not with NSCoder")
  }

  func testSaveButtonTapped() {
    view?.noteTextField.text = "Test"

    view?.saveButtonTapped()

    XCTAssert(mockEvent?.invokedAddListTapped == true, "Expect add list tapped is called")
    XCTAssert(mockEvent?.invokedAddListTappedCount == 1, "Expect add list tapped is called once")
    XCTAssert(mockEvent?.invokedAddListTappedParameters?.data["id"] != nil, "Expect add list param contain id")
    XCTAssert(mockEvent?.invokedAddListTappedParameters?.data["title"] as? String == "Test", "Expect add list param contain title")
  }

  func testShowInformationAlert() {
    view?.showInformation(withMessage: "Fill this information")

    XCTAssert(view?.alertView?.message == "Fill this information", "Expect alert is have a message")
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
}
