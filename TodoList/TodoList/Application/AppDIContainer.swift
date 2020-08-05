//
//  AppDIContainer.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class AppDIContainer {
  func makeTodoSceneDIContainer() -> TodoSceneDIContainer {
    return TodoSceneDIContainer()
  }
}
