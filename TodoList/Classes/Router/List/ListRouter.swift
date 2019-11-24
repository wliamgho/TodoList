//
//  ListRouter.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ListRouter: Router {
  var viewController: UIViewController {
    let controller = ListViewController()
    let interactor = ListInteractor(coreDataManager: coreDataManager)
    let presenter = ListPresenter(view: controller, interactor: interactor, router: self)

    let navigationController = UINavigationController(rootViewController: controller)

    controller.event = presenter
    interactor.output = presenter
    presenter.view = controller

    return navigationController
  }

  func pushToAddListRouter(viewController: UIViewController?) {
    let addListRouter = AddListRouter()

    viewController?.navigationController?.pushViewController(addListRouter.viewController,
                                                            animated: true)
  }

  func presentToDetailRouter(todoList: TodoList, viewController: UIViewController?) {
    let detailListRouter = DetailListRouter(todoList: todoList)

    viewController?.present(detailListRouter.viewController,
                            animated: true, completion: nil)
  }
}
