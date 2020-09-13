//
//  TodoSceneCoordinator.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

protocol TodoSceneCoordinatorDependencies: class {
  func makeListViewController(closures: ListViewModelClosures) -> ListViewController

  func makeDetailViewController(with item: TodoModel) -> DetailViewController

  func makeAddViewController(with todo: [TodoModel]) -> AddViewController
}

final class TodoSceneCoordinator: BaseCoordinator {
  private let router: Router
  private let dependencies: TodoSceneCoordinatorDependencies

  init(router: Router, dependencies: TodoSceneCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let closures = ListViewModelClosures(showDetailView: showDetailView(item:),
                                         showAddItemView: addTodoItemView(todo:))
    let view = dependencies.makeListViewController(closures: closures)
    router.setRootModule(view)
  }

  private func showDetailView(item: TodoModel) {
    let view = dependencies.makeDetailViewController(with: item)
    router.push(view)
  }

  private func addTodoItemView(todo: [TodoModel]) {
    let view = dependencies.makeAddViewController(with: todo)
    router.push(view)
  }
}
