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
}

final class DefaultTodoRepository {
  // Init network service
}

extension DefaultTodoRepository: TodoRepository {
  func fetchTodoList(completion: @escaping (Result<[TodoModel], Error>) -> Void) {
    let data: [TodoModel] = [TodoModel(name: "TEST 1"), TodoModel(name: "TEST 2")]
//    let data: [TodoModel] = [TodoModel]()
    DispatchQueue.main.async {
      completion(.success(data))
    }
  }
}
