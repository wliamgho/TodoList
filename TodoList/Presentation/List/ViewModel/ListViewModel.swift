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
  var state: Observable<LoadingStateViewModel.State> = Observable(.initialize)

  init(repository: TodoRepository, closures: ListViewModelClosures? = nil) {
    self.repository = repository
    self.closures = closures
  }

  // TODOs: - Refactor here
  private func load(loading: TodoListViewModelLoading) {
//    self.state.value?.state = .loading(state: loading)
    self.state.value = .loading
    self.repository.fetchTodoList(completion: { result in
      switch result {
      case .success(let data):
        // Append Data
//        self.list.value = data
        self.state.value = .success
      case .failure(_):
        // Error here
        fatalError("ERROR FETCH TODO LIST")
        self.state.value = .failed
      }
//      self.loading.value = .none
//      self.state.value?.value = .fetch(result)
      
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

extension DefaultListViewModel {
  enum State {
    case idle
    case loading
    case loaded([TodoModel])
    case error(Error)
  }

  enum Event {
    case onAppear
    case onSelectItem
    case onLoadItem
    case onFailedToLoadItem(Error)
  }
}
