//
//  CoreDataManager.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import CoreData

enum CoreDataManagerError: Error {
  case readError(Error)
  case saveError(Error)
  case deleteError(Error)
}

public final class CoreDataManager {
  public static let shared = CoreDataManager()

  // MARK: - Core Data stack
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "TodoList")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        // TODO: - Log to Crashlytics
        assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
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
        // TODO: - Log to Crashlytics
        assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
      }
    }
  }

  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    persistentContainer.performBackgroundTask(block)
  }
}
