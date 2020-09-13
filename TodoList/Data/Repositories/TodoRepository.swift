//
//  TodoListRepository.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

protocol TodoRepository {
  func fetchTodoList(completion: @escaping(Result<[TodoModel], Error>) -> Void)

  func addTodoList(todo: TodoModel, completion: @escaping(Result<Void, Error>) -> Void)
}

final class DefaultTodoRepository {
  // Init network service
  var todo: [TodoModel]

  init(todo: [TodoModel]) {
    self.todo = todo
  }
}

extension DefaultTodoRepository: TodoRepository {
  func fetchTodoList(completion: @escaping (Result<[TodoModel], Error>) -> Void) {
//    let data: [TodoModel] = [TodoModel(todo: "TEST 1", date: "0"), TodoModel(todo: "TEST 2", date: "0")]
    completion(.success(todo))
  }

  func addTodoList(todo: TodoModel, completion: @escaping (Result<Void, Error>) -> Void) {
    self.todo.append(todo)
    completion(.success(()))
  }
}
