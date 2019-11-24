//
//  ListEvent.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ListEvent: class {
  func fetchTodoList()

  func addButtonTapped(view: ListViewController)

  func itemListTapped(todoList: TodoList)
}
