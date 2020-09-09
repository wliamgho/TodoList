//
//  AddViewController.swift
//  TodoList
//
//  Created by William on 09/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, NibInstantiable {
  private var viewModel: AddViewModel!

  static func create(to viewModel: AddViewModel) -> AddViewController {
    let view = AddViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
