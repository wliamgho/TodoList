//
//  ListPresenter.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ListPresenter: ListEvent, ListInteractorOutput {
  weak var view: ListView?
  let interactor: ListInteractorInput
  let router: ListRouter

  init(view: ListView, interactor: ListInteractorInput, router: ListRouter) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}
