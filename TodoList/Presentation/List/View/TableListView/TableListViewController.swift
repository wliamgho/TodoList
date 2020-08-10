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
    let value = viewModel.state.value
    switch value {
    case .loaded(let data):
      return data.count
    case .loading(let data):
      return data?.count ?? 0
    case .error(_):
      return 0
    case .idle:
      return 0
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemCell.reuseIdentifier(),
                                                   for: indexPath) as? ListItemCell else { return UITableViewCell() }
    let data = viewModel.state.value
    switch data {
    case .idle:
      break
    case .loading(_):
      break
    case .loaded(let todo):
      let item = todo[indexPath.row]
      cell.listData(list: item)
    case .error(_):
      break
    }

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)

//    viewModel.itemDidSelect(item: viewModel.list.value[indexPath.row])
  }
}
