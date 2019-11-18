//
//  ListItemCell.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
  @IBOutlet weak var itemLabel: UILabel!

  weak var todo: TodoList? {
    didSet {
      didSetTodoItem()
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

  private func didSetTodoItem() {
    guard let todo = todo else { return }

    itemLabel.text = todo.title
  }
    
}
