//
//  MockCoreDataManager.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockCoreDataManager: CoreDataManager {
  var invokedEntitiesSetter = false
  var invokedEntitiesSetterCount = 0
  var invokedEntities: [Entity]?
  var invokedEntitiesList = [[Entity]]()
  var invokedEntitiesGetter = false
  var invokedEntitiesGetterCount = 0
  var invokedCreateEntity = false
  var invokedCreateEntityCount = 0
  var invokedCreateEntityParameters: (ofType: Any, data: [String: Any])?
  var invokedCreateEntityParametersList = [(ofType: Any, data: [String: Any])]()
  override func createEntity<T: Entity>(ofType: T.Type, withData data: [String: Any]) -> T? {
    invokedCreateEntity = true
    invokedCreateEntityCount += 1
    invokedCreateEntityParameters = (ofType, data)
    invokedCreateEntityParametersList.append((ofType, data))
    return super.createEntity(ofType: ofType, withData: data)
  }
  var invokedUpdate = false
  var invokedUpdateCount = 0
  var invokedUpdateParameters: (entity: Any, data: [String: Any])?
  var invokedUpdateParametersList = [(entity: Any, data: [String: Any])]()
  var stubbedUpdateResult: Any!
  override func update<T: Entity>(entity: T, data: [String: Any]) -> T? {
    invokedUpdate = true
    invokedUpdateCount += 1
    invokedUpdateParameters = (entity, data)
    invokedUpdateParametersList.append((entity, data))
    return super.update(entity: entity, data: data)
  }
  var invokedDeleteData = false
  var invokedDeleteDataCount = 0
  var invokedDeleteDataParameters: (entityName: String, Void)?
  var invokedDeleteDataParametersList = [(entityName: String, Void)]()
  override func deleteData(_ entityName: String) {
    invokedDeleteData = true
    invokedDeleteDataCount += 1
    invokedDeleteDataParameters = (entityName, ())
    invokedDeleteDataParametersList.append((entityName, ()))
    super.deleteData(entityName)
  }
  var invokedFetch = false
  var invokedFetchCount = 0
  var invokedFetchParameters: (ofType: Any, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?)?
  var invokedFetchParametersList = [(ofType: Any, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?)]()
  var stubbedFetchResult: [Any]! = []
  override func fetch<T: Entity>(ofType: T.Type,
  withPredicate predicate: NSPredicate? = nil,
  sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
    invokedFetch = true
    invokedFetchCount += 1
    invokedFetchParameters = (ofType, predicate, sortDescriptors)
    invokedFetchParametersList.append((ofType, predicate, sortDescriptors))
    
    return super.fetch(ofType: ofType, withPredicate: predicate, sortDescriptors: sortDescriptors)
  }
  var invokedSaveContext = false
  var invokedSaveContextCount = 0
  override func saveContext() {
    invokedSaveContext = true
    invokedSaveContextCount += 1
    super.saveContext()
  }
}
