//
//  Todo.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import CoreData

extension TodoList: Entity {
  static func entityName() -> String {
    return String(describing: self)
  }

  static func parse(json: [String : Any], context: NSManagedObjectContext) -> Entity? {
    guard let todo = NSEntityDescription.insertNewObject(forEntityName: entityName(),
                                                         into: context) as? TodoList else {
      return nil
    }

    todo.id = json["id"] as? Int64 ?? 0
    todo.title = json["title"] as? String

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
    self.id = json["id"] as? Int64 ?? 0
    self.title = json["title"] as? String

    return self
  }
  
  func toJson() -> [String : Any] {
    return ["id": self.id,
            "title": self.title ?? ""]
  }
}
