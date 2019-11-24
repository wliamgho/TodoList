//
//  DetailListInteractor.swift
//  TodoList
//
//  Created by William on 24/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class DetailListInteractor: DetailListInteractorInput {
  weak var output: DetailListInteractorOutput?

  private let coreDataManager: CoreDataManager

  init(coreDataManager: CoreDataManager) {
    self.coreDataManager = coreDataManager
  }
}
