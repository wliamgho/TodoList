//
//  Router.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

protocol Router {
  var viewController: UIViewController { get }
}

extension Router {
  var coreDataManager: CoreDataManager {
    guard let coreDataManager = (UIApplication.shared.delegate as? AppDelegate)?.coreDataManager else {
      fatalError("Invalid called core data manager")
    }

    return coreDataManager
  }
}

