//
//  AppDIContainer.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

/// Contains Application Container of Dependency Injection from another class
final class AppDIContainer {
  lazy var config = AppConfiguration()

  // Instance network service

  func makeTodoSceneDIContainer() -> TodoSceneDIContainer {
    return TodoSceneDIContainer()
  }
}
