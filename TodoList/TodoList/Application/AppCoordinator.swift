//
//  AppCoordinator.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
  private let router: Router
  private let container: AppDIContainer
  
  init(router: Router, container: AppDIContainer) {
    self.router = router
    self.container = container
  }

  override func start() {
    // Implement Deeplink here
    let todoSceneContainer = container.makeTodoSceneDIContainer()
    let coordinator = todoSceneContainer.makeTodoSceneCoordinator(router: router)
    coordinator.start()
  }
}
