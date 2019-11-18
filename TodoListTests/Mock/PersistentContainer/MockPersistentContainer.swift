//
//  MockPersistentContainer.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import CoreData

class MockPersistentContainer {
  lazy var container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "TodoList")
    let description = NSPersistentStoreDescription()
    description.type = NSInMemoryStoreType
    description.shouldAddStoreAsynchronously = false

    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores(completionHandler: { (description, error) in
      precondition(description.type == NSInMemoryStoreType)
      if let error = error {
        fatalError("Create an in-memory coordinator failed \(error)")
      }
    })
    return container
  }()
}
