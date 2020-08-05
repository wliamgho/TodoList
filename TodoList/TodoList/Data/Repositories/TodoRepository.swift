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
  private let data: [TodoModel]

  init(data: [TodoModel]) {
    self.data = data
  }
}

extension DefaultTodoRepository: TodoRepository {
  func fetchTodoList(completion: @escaping (Result<[TodoModel], Error>) -> Void) {
    DispatchQueue.main.async {
      completion(.success(self.data))
    }
  }
}
