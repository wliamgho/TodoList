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
}

final class TodoSceneCoordinator: BaseCoordinator {
  private let router: Router
  private let dependencies: TodoSceneCoordinatorDependencies

  init(router: Router, dependencies: TodoSceneCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let closures = ListViewModelClosures(showDetailView: showDetailView(item:))
    let view = dependencies.makeListViewController(closures: closures)
    router.setRootModule(view, hideBar: true)
  }

  private func showDetailView(item: TodoModel) {
    let view = dependencies.makeDetailViewController(with: item)
    router.present(view)
  }
}
