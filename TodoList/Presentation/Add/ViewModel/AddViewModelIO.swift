//
//  AddViewModelIO.swift
//  TodoList
//
//  Created by William on 09/09/20.
//  Copyright © 2020 william. All rights reserved.
//

protocol AddViewModelInput: class {
  func addTodoItem(todo: TodoModel, completion: @escaping(Result<Void, Error>) -> Void)
}

protocol AddViewModelOutput: class {
}

protocol AddViewModel: AddViewModelInput, AddViewModelOutput {}
