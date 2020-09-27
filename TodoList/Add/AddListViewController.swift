//
//  AddListViewController.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

  private lazy var contentView: AddListView = AddListView.create()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(contentView)
    contentView.edgesToSuperview()
  }
}
