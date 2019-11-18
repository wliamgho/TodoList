//
//  CoreDataManager.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
  let persistentContainer: NSPersistentContainer

  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }

  // MARK: - Core Data Creating Entity with Data
  func createEntity<T: Entity>(ofType: T.Type, withData data: [String: Any]) -> T? {
    let entity = T.parse(json: data, context: persistentContainer.viewContext)

    return entity as? T
  }

  // MARK: - Core Data Creating Entity
  func createEntity<T: Entity>(ofType: T.Type) -> T? {
    let newEntity = T.newEntity(context: persistentContainer.viewContext)

    return newEntity as? T
  }

  // MARK: - Core Data Updating Entity
  func update<T: Entity>(entity: T, data: [String: Any]) -> T? {
    return entity.update(json: data) as? T
  }

  // MARK: - Core Data Delete Entity Data
  func deleteData(_ entityName: String) {
    let fetchRequests = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    fetchRequests.returnsObjectsAsFaults = false

    do {
      let results = try persistentContainer.viewContext.fetch(fetchRequests)
      for object in results {
        guard let objectData = object as? NSManagedObject else { continue }
        debugPrint("Deleting: \(objectData)")

        persistentContainer.viewContext.delete(objectData)
      }
    } catch let error {
      debugPrint("Failed deleting: \(entityName) with error: \(error.localizedDescription)")
    }
  }

  // MARK: - Core Data Fetching
  func fetch<T: Entity>(ofType: T.Type,
                        withPredicate predicate: NSPredicate? = nil,
                        sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityName())
    request.returnsObjectsAsFaults = false
    request.predicate = predicate
    request.sortDescriptors = sortDescriptors

    var entities = [T]()

    do {
      let fetchResult = try persistentContainer.viewContext.fetch(request)

      for data in fetchResult {
        if let entity = data as? T {
          entities.append(entity)
        }
      }
    } catch {
      debugPrint("Error when fetching")
    }

    return entities
  }

  // MARK: - Core Data Saving support
  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
