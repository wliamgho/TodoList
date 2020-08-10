//
//  TableListViewController.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class TableListViewController: UITableViewController {
  var viewModel: ListViewModel!

  func reload() {
    tableView.reloadData()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.estimatedRowHeight = 64
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(UINib(nibName: ListItemCell.reuseIdentifier(),
                             bundle:  nil),
                       forCellReuseIdentifier: ListItemCell.reuseIdentifier())
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
//    return viewModel.list.value.count
    return 40
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemCell.reuseIdentifier(),
                                                   for: indexPath) as? ListItemCell else { return UITableViewCell() }
//    let data = viewModel.list.value[indexPath.row]
//    cell.listData(list: data)
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)

//    viewModel.itemDidSelect(item: viewModel.list.value[indexPath.row])
  }
}
