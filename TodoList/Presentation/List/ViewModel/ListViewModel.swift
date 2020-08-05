//
//  ListViewModel.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation


struct ListViewModelClosures {
  let showDetailView: ((TodoModel) -> Void)?
}

final class DefaultListViewModel: ListViewModel {
  private let repository: TodoRepository
  private let closures: ListViewModelClosures?

  // MARK: - Output
  let loading: Observable<TodoListViewModelLoading?> = Observable(.none)
  let list: Observable<[TodoModel]> = Observable([])

  init(repository: TodoRepository, closures: ListViewModelClosures? = nil) {
    self.repository = repository
    self.closures = closures
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

// MARK: - Input
extension DefaultListViewModel: ListViewModelInput {
  func getTodoList() {
    load(loading: .screen)
  }

  func itemDidSelect(item: TodoModel) {
    closures?.showDetailView?(item)
  }
}
