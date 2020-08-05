//
//  ListViewModelIO.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

enum TodoListViewModelLoading {
  case screen
}

protocol ListViewModelInput: class {
  func getTodoList()
  func itemDidSelect(item: TodoModel)
}

protocol ListViewModelOutput: class {
  var loading: Observable<TodoListViewModelLoading?> { get }
  var list: Observable<[TodoModel]> { get }
}

protocol ListViewModel: ListViewModelInput, ListViewModelOutput {}
