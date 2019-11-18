//
//  Todo.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import CoreData

enum TodoListKey: String {
  case id
  case title
}

extension TodoList: Entity {
  static func entityName() -> String {
    return String(describing: self)
  }

  static func create(json: [String : Any], context: NSManagedObjectContext) -> Entity? {
    guard let todo = NSEntityDescription.insertNewObject(forEntityName: entityName(),
                                                         into: context) as? TodoList else {
      return nil
    }

    todo.update(json: json)

    return todo
  }
  
  func same(entity: Entity?) -> Bool {
    guard let todo = entity as? TodoList else { return false }

    return self.id == todo.id && self.title == todo.title
  }
  
  static func newEntity(context: NSManagedObjectContext) -> Entity? {
    guard let todo = NSEntityDescription.insertNewObject(forEntityName: entityName(),
                                                         into: context) as? TodoList else {
        return nil
    }

    return todo
  }
  
  func update(json: [String : Any]) -> Entity {
    for (_, data) in json.enumerated() {
      guard let key = TodoListKey(rawValue: data.key) else { continue }

      switch key {
      case .id:
        guard let id = data.value as? Int64 else { continue }
        self.id = id
      case .title:
        guard let title = data.value as? String else { continue }
        self.title = title
      }
    }
    return self
  }
}
