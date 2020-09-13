//
//  ListItemCell.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!

  func listData(list: TodoModel) {
    titleLabel.text = list.todo
  }

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }

}
