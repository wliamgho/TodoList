//
//  AddListViewController.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController, AddListView {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var saveButton: UIButton!

  var event: AddListEvent?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
