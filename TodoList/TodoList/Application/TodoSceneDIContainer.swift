//
//  TodoSceneDIContainer.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class TodoSceneDIContainer {
  lazy var todo: [TodoModel] = [TodoModel]()

  func makeTodoSceneCoordinator(router: Router) -> Coordinator {
    return TodoSceneCoordinator(router: router, dependencies: self)
  }
}

extension TodoSceneDIContainer: TodoSceneCoordinatorDependencies {
  func makeTodoRepository() -> TodoRepository {
    return DefaultTodoRepository(data: todo)
  }

  func makeListViewModel() -> ListViewModel {
    return DefaultListViewModel(repository: makeTodoRepository())
  }
  
  func makeListViewController() -> ListViewController {
    return ListViewController.create(to: makeListViewModel())
  }
}
