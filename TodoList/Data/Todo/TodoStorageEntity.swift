//
//  TodoStorageEntity.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import CoreData

extension Todo {
  convenience init(todo: TodoQuery, insertInto context: NSManagedObjectContext) {
    self.init(context: context)
    task = todo.task
    createdAt = Date()
  }

  func toDomain() -> TodoQuery {
    return .init(task: task ?? "")
  }
}
