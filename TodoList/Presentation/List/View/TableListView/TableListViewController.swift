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

  var loadingView: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView()
    view.style = .large
    view.color = .black
    view.startAnimating()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var emptyViewLoading: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  func reload() {
    tableView.reloadData()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureEmptyView()

    tableView.estimatedRowHeight = 64
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(UINib(nibName: ListItemCell.reuseIdentifier(), bundle:  nil),
                       forCellReuseIdentifier: ListItemCell.reuseIdentifier())
  }

  private func configureEmptyView() {
    tableView.backgroundView = emptyViewLoading

    emptyViewLoading.addSubview(loadingView)
    NSLayoutConstraint.activate([
      loadingView.centerXAnchor.constraint(equalTo: emptyViewLoading.centerXAnchor),
      loadingView.centerYAnchor.constraint(equalTo: emptyViewLoading.centerYAnchor),
      loadingView.heightAnchor.constraint(equalToConstant: 40),
      loadingView.widthAnchor.constraint(equalToConstant: 40)
    ])
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let value = viewModel.state.value
    switch value {
    case .success(let data): // Success fetch
      tableView.separatorStyle = .singleLine
      loadingView.stopAnimating()
      return data.count
    case .loading(_): // Loading data
      tableView.separatorStyle = .none
      return 0
    case .error(_): // Error
      return 0
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemCell.reuseIdentifier(),
                                                   for: indexPath) as? ListItemCell else { return UITableViewCell() }
    let data = viewModel.state.value
    switch data {
    case .success(let todo):
      let item = todo[indexPath.row]
      cell.listData(list: item)
    default:
      break
    }

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)

    let data = viewModel.state.value
    switch data {
    case .success(let todo):
      viewModel.itemDidSelect(item: todo[indexPath.row])
    default:
      break
    }
  }
}
