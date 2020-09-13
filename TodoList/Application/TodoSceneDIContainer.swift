//
//  TodoSceneDIContainer.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class TodoSceneDIContainer {
  var todo: [TodoModel] = [TodoModel]()
//  var todo = [TodoModel(todo: "Test", date: "Date test")]

  func makeTodoSceneCoordinator(router: Router) -> Coordinator {
    return TodoSceneCoordinator(router: router, dependencies: self)
  }
}

extension TodoSceneDIContainer: TodoSceneCoordinatorDependencies {
  // MARK: - Repository
  func makeTodoRepository() -> TodoRepository {
    return DefaultTodoRepository(todo: todo)
  }

  // MARK: - ViewModel
  func makeListViewModel(closures: ListViewModelClosures) -> ListViewModel {
    return DefaultListViewModel(repository: makeTodoRepository(),
                                closures: closures)
  }

  func makeDetailViewModel(item: TodoModel) -> DetailViewModel {
    return DefaultDetailViewModel(item: item)
  }

  func makeAddViewModel(todo: [TodoModel]) -> AddViewModel {
    return DefaultAddViewModel(repository: makeTodoRepository())
  }

  // MARK: - View
  func makeListViewController(closures: ListViewModelClosures) -> ListViewController {
    return ListViewController.create(to: makeListViewModel(closures: closures))
  }

  func makeDetailViewController(with item: TodoModel) -> DetailViewController {
    return DetailViewController.create(to: makeDetailViewModel(item: item))
  }

  func makeAddViewController(with todo: [TodoModel]) -> AddViewController {
    return AddViewController.create(to: makeAddViewModel(todo: todo))
  }
}
