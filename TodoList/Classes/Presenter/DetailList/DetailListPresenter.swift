//
//  DetailListPresenter.swift
//  TodoList
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class DetailListPresenter: DetailListEvent, DetailListInteractorOutput {
  weak var view: DetailListView?
  let interactor: DetailListInteractorInput
  let router: DetailListRouter

  init(view: DetailListView, interactor: DetailListInteractorInput, router: DetailListRouter) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}
