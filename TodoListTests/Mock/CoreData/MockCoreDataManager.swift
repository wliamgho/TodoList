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
  var stubbedEntities: [Entity]! = []
  var invokedCreateEntityOfType = false
  var invokedCreateEntityOfTypeCount = 0
  var invokedCreateEntityOfTypeParameters: (ofType: Any, data: [String: Any])?
  var invokedCreateEntityOfTypeParametersList = [(ofType: Any, data: [String: Any])]()
  var stubbedCreateEntityOfTypeResult: Any!
  override func createEntity<T: Entity>(ofType: T.Type, withData data: [String: Any]) -> T? {
    invokedCreateEntityOfType = true
    invokedCreateEntityOfTypeCount += 1
    invokedCreateEntityOfTypeParameters = (ofType, data)
    invokedCreateEntityOfTypeParametersList.append((ofType, data))
    return stubbedCreateEntityOfTypeResult as? T
  }
  var invokedCreateEntity = false
  var invokedCreateEntityCount = 0
  var invokedCreateEntityParameters: (ofTyoe: Any, Void)?
  var invokedCreateEntityParametersList = [(ofTyoe: Any, Void)]()
  var stubbedCreateEntityResult: Any!
  override func createEntity<T: Entity>(ofTyoe: T.Type) -> T? {
    invokedCreateEntity = true
    invokedCreateEntityCount += 1
    invokedCreateEntityParameters = (ofTyoe, ())
    invokedCreateEntityParametersList.append((ofTyoe, ()))
    return stubbedCreateEntityResult as? T
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
    return stubbedUpdateResult as? T
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
    return stubbedFetchResult as! [T]
  }
  var invokedSaveContext = false
  var invokedSaveContextCount = 0
  override func saveContext() {
    invokedSaveContext = true
    invokedSaveContextCount += 1
  }
}
