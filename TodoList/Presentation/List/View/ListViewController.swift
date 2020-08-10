//
//  ListViewController.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, NibInstantiable {
  @IBOutlet weak var contentView: UIView!

  private var viewModel: ListViewModel!
  private var listTableViewController: TableListViewController = TableListViewController(style: .plain)

  
  /// Instance class
  /// - Parameter viewModel: ViewModel Object
  /// - Returns: UIViewController class
  static func create(to viewModel: ListViewModel) -> ListViewController {
    let view = ListViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureLayout()

    viewModel?.getTodoList()
    bind(to: viewModel)
  }

  private func configureLayout() {
    self.addChild(listTableViewController)

    listTableViewController.didMove(toParent: self)
    listTableViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    listTableViewController.view.frame = contentView.bounds
    listTableViewController.viewModel = viewModel

    contentView.addSubview(listTableViewController.view)
  }
  
  
  /// As a propery wrappers which are designed for reference types to be shared
  /// - Parameter viewModel: ViewModel Interface
  private func bind(to viewModel: ListViewModel) {
//    viewModel.list.observe(on: self) { [weak self] _ in self?.updateItems() }
//    viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading(status: $0) }
//    viewModel.state.observe(on: self) { [weak self] _ in
//      self?.updateItems(state: )
//      self?.updateItems(state: $0)
//    }
    viewModel.state.observe(on: self) { [weak self] (test) in self?.updateItems(state: test) }
  }

  private func updateItems(state: LoadingStateViewModel.State) {
    switch state {
    case .initialize:
      print("IS INITIALIZE")
    case .loading:
      print("IS LOADING")
    case .success:
      print("IS SUCCESS")
    case .failed:
      print("IS FAILED")
    }
    
  }

  private func updateLoading(status: TodoListViewModelLoading?) {
    // Set loading
  }
}
