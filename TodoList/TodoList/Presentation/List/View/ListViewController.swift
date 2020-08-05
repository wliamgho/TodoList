//
//  ListViewController.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, NibInstantiable {
  private var viewModel: ListViewModel!
  private var listTableView: TableListViewController!

  static func create(to viewModel: ListViewModel) -> ListViewController {
    let view = ListViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel?.getTodoList()
    bind(to: viewModel)
  }

  private func bind(to viewModel: ListViewModel) {
    viewModel.list.observe(on: self) { [weak self] _ in self?.updateItems() }
    viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading(status: $0) }
  }

  private func updateItems() {
    // reload table
  }

  private func updateLoading(status: TodoListViewModelLoading?) {
    // Set loading
  }
}
