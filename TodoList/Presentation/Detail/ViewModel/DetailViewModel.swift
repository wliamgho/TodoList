//
//  DetailViewModel.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class DefaultDetailViewModel: DetailViewModel {
  var name: String

  init(item: TodoModel) {
    self.name = item.name
  }
}
