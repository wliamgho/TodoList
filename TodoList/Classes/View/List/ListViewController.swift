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
  @IBOutlet var addBarButton: UIBarButtonItem!
  
  private var todoList = [TodoList]()

  var event: ListEvent?

  // MARK: - Initialize
  init() {
    super.init(nibName: "ListViewController", bundle: nil)

    loadViewIfNeeded()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.title = "TodoList"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    event?.fetchTodoList()

    self.navigationItem.rightBarButtonItem = addBarButton

    tableView.register(UINib(nibName: "ListItemCell", bundle: nil), forCellReuseIdentifier: "ListItemCell")
  }

  // MARK: - View
  func showTodoList(todoList: [TodoList]) {
    self.todoList = todoList

    tableView.reloadData()
  }

  @IBAction func addButtonTapped() {
    event?.addButtonTapped(view: self)
  }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoList.count
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    switch cell {
    case is ListItemCell:
      guard let cell = cell as? ListItemCell else { return }
      cell.todo = todoList[indexPath.row]
    default:
      break
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell") as? ListItemCell else {
      return UITableViewCell()
    }
    return cell
  }
}
