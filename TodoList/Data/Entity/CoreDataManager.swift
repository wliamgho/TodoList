//
//  CoreDataManager.swift
//  TodoList
//
//  Created by William on 17/02/21.
//  Copyright © 2021 william. All rights reserved.
//

import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()

  // MARK: - Core Data stack
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "TodoList")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        assertionFailure("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()

  // MARK: - Core Data Saving support
   func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        assertionFailure("Unresolved error \(error), \((error as NSError).userInfo)")
      }
    }
   }
}

