//
//  AddListRouter.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class AddListRouter: Router {
  var viewController: UIViewController {
    let controller = AddListViewController()
    let interactor = AddListInteractor(coreDataManager: coreDataManager)
    let presenter = AddListPresenter(view: controller, interactor: interactor, router: self)

    controller.event = presenter
    interactor.output = presenter
    presenter.view = controller

    return controller
  }
}
