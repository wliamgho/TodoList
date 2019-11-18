//
//  AddListInteractor.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import CoreData

class AddListInteractor: AddListInteractorInput {
  weak var output: AddListInteractorOutput?

  private let coreDataManager: CoreDataManager

  init(coreDataManager: CoreDataManager) {
    self.coreDataManager = coreDataManager
  }

  // MARK: - Input
  func addTodoList(data: [String : Any]) {
    guard let newTodoList = coreDataManager.createEntity(ofType: TodoList.self, withData: data) else {
      // Failed to create TodoList
      output?.failedToAddNewList(errMessage: "Invalid add new list")
      return
    }

    self.coreDataManager.saveContext()
    // Output
    output?.addedNewList(todoList: newTodoList)
  }
}
