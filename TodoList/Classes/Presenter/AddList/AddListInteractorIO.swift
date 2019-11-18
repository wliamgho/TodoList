//
//  AddListInteractorIO.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol AddListInteractorInput: class {
  func addTodoList(data: [String: Any])
}

protocol AddListInteractorOutput: class {
  func failedToAddNewList(errMessage: String)

  func addedNewList(todoList: TodoList)
}
