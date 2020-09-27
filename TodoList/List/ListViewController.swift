//
//  ListViewController.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit
import TinyConstraints

final class ListViewController: UIViewController {
  private lazy var contentView: ListView = ListView.create()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.title = "ToDo List"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationBarItem()

    self.view.addSubview(contentView)
    contentView.edgesToSuperview()
  }

  private func navigationBarItem() {
    let addBarItem = UIBarButtonItem(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(self.addListItem))
    self.navigationItem.rightBarButtonItem = addBarItem
  }

  @objc private func addListItem() {
    
  }
}
