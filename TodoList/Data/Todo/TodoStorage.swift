//
//  TodoStorage.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation
import CoreData

protocol TodoListEntity {
  func fetchTodoList(completion: @escaping(Result<[TodoQuery], Error>) -> Void)

  func saveTodoList(todo: TodoQuery, completion: @escaping(Result<TodoQuery, Error>) -> Void)
}

final class TodoStorage {
  private let coreDataManager: CoreDataManager

  init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
    self.coreDataManager = coreDataManager
  }

  private func clearQueries(for query: TodoQuery, withContext context: NSManagedObjectContext) throws {
    let request: NSFetchRequest = Todo.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: #keyPath(Todo.createdAt), ascending: false)]
    var result = try context.fetch(request)

    removeDuplicates(for: query, in: &result, withContext: context)
  }

  private func removeDuplicates(for query: TodoQuery, in queries: inout [Todo], withContext context: NSManagedObjectContext) {
    queries
      .filter { $0.task == query.task }
      .forEach { context.delete($0) }
  }
}

extension TodoStorage: TodoListEntity {
  func fetchTodoList(completion: @escaping (Result<[TodoQuery], Error>) -> Void) {
    coreDataManager.performBackgroundTask { context in
      do {
        let request: NSFetchRequest = Todo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(Todo.createdAt), ascending: false)]
        let result = try context.fetch(request).map { $0.toDomain() }
        completion(.success(result))
      } catch {
        completion(.failure(CoreDataManagerError.readError(error)))
      }
    }
  }
  
  func saveTodoList(todo: TodoQuery, completion: @escaping (Result<TodoQuery, Error>) -> Void) {
    coreDataManager.performBackgroundTask { [weak self] (context) in
      guard let self = self else { return }
      
      do {
        try self.clearQueries(for: todo, withContext: context)
        let entity = Todo(todo: todo, insertInto: context)
        try context.save()
        completion(.success(entity.toDomain()))
      } catch {
        completion(.failure(CoreDataManagerError.saveError(error)))
      }
    }
  }
}
