//
//  ListViewController.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListView {
  @IBOutlet weak var tableView: UITableView!

  var event: ListEvent?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
