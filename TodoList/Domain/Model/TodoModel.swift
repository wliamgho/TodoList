//
//  TodoModel.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

class TodoModel {
  let todo: String
  let date: String

  init(todo: String, date: String) {
    self.todo = todo
    self.date = date
  }
}

