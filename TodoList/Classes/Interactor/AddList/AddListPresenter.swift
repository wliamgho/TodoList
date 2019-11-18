//
//  AddListPresenter.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class AddListPresenter: AddListEvent, AddListInteractorOutput {
  weak var view: AddListView?
  let interactor: AddListInteractorInput
  let router: AddListRouter

  init(view: AddListViewController, interactor: AddListInteractorInput, router: AddListRouter) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}
