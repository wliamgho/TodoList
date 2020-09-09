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
  @IBOutlet var addBarButton: UIBarButtonItem!
  
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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationItem.title = "ToDo"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.rightBarButtonItem = addBarButton
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
    viewModel.state.observe(on: self) { [weak self] state in self?.updateItems(state: state) }
  }

  private func updateItems(state: DataState<[TodoModel], Error>) {
    switch state {
    case .success(let data):
      print("SUCCESS", data)
      listTableViewController.reload()
    default:
      return
    }
  }

  @IBAction func addButtonTapped(_ sender: Any) {
    viewModel.addTodoItem()
  }
  
}
