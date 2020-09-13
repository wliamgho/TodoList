//
//  AddViewModel.swift
//  TodoList
//
//  Created by William on 09/09/20.
//  Copyright © 2020 william. All rights reserved.
//

final class DefaultAddViewModel: AddViewModel {
  private let repository: TodoRepository

  init(repository: TodoRepository) {
    self.repository = repository
  }

  func addTodoItem(todo: TodoModel, completion: @escaping (Result<Void, Error>) -> Void) {
    repository.addTodoList(todo: todo) { (result) in
      switch result {
      case .success(_):
        print("HERE")
        completion(.success(()))
      case .failure(let error):
        print("ERROR", error.localizedDescription)
        completion(.failure(error))
      }
    }
  }
}
