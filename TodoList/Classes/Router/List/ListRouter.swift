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
    let interactor = ListInteractor()
    let presenter = ListPresenter(view: controller, interactor: interactor, router: self)

    let navigationController = UINavigationController(rootViewController: controller)

    controller.event = presenter
    interactor.output = presenter

    return navigationController
  }
}
