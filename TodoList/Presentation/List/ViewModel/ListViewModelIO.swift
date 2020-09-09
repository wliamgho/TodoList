//
//  ListViewModelIO.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

protocol ListViewModelInput: class {
  func getTodoList()
  func itemDidSelect(item: TodoModel)
}

protocol ListViewModelOutput: class {
  var state: Observable<DataState<[TodoModel], Error>> { get }
}

protocol ListViewModel: ListViewModelInput, ListViewModelOutput {}
