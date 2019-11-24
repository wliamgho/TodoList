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
  var interactor: DetailListInteractorInput
  var router: DetailListRouter

  init(view: DetailListView, interactor: DetailListInteractorInput, router: DetailListRouter) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}
