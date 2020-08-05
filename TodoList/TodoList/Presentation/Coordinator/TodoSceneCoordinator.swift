//
//  TodoSceneCoordinator.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

protocol TodoSceneCoordinatorDependencies: class {
  func makeListViewController() -> ListViewController
}

final class TodoSceneCoordinator: BaseCoordinator {
  private let router: Router
  private let dependencies: TodoSceneCoordinatorDependencies

  init(router: Router, dependencies: TodoSceneCoordinatorDependencies) {
    self.router = router
    self.dependencies = dependencies
  }

  override func start() {
    let view = dependencies.makeListViewController()
    router.setRootModule(view)
  }
}
