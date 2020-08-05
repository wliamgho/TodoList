//
//  ListViewModel.swift
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
}

protocol ListViewModelOutput: class {
  var loading: Observable<TodoListViewModelLoading?> { get }
  var list: Observable<[TodoModel]> { get }
}

protocol ListViewModel: ListViewModelInput, ListViewModelOutput {}


final class DefaultListViewModel: ListViewModel {
  private let repository: TodoRepository

  // MARK: - Output
  let loading: Observable<TodoListViewModelLoading?> = Observable(.none)
  let list: Observable<[TodoModel]> = Observable([])

  init(repository: TodoRepository) {
    self.repository = repository
  }

  private func load(loading: TodoListViewModelLoading) {
    self.loading.value = loading

    self.repository.fetchTodoList(completion: { result in
      switch result {
      case .success(let data):
        // Append Data
        self.list.value = data
      case .failure(_):
        // Error here
        fatalError("ERROR FETCH TODO LIST")
      }
      self.loading.value = .none
    })
  }
}

extension DefaultListViewModel: ListViewModelInput {
  func getTodoList() {
    load(loading: .screen)
  }
}
