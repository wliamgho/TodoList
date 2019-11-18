//
//  Entity.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import CoreData

protocol Entity {
  static func entityName() -> String

  static func create(json: [String: Any], context: NSManagedObjectContext) -> Entity?

  func same(entity: Entity?) -> Bool

  static func newEntity(context: NSManagedObjectContext) -> Entity?

  func update(json: [String: Any]) -> Entity
}
