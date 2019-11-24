//
//  AddListViewController.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//
import UIKit

class AddListViewController: UIViewController, AddListView {
  @IBOutlet weak var noteTextField: UITextField!
  @IBOutlet weak var saveButton: UIButton!

  private(set) var alertView: UIAlertController?

  var event: AddListEvent?

  init() {
    super.init(nibName: "AddListViewController", bundle: nil)

    loadViewIfNeeded()
  }

  required init?(coder: NSCoder) {
    return nil
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func saveButtonTapped() {
    var data = [String: Any]()
    let randomInt = Int64.random(in: 0..<99)

    data[TodoListKey.id.rawValue] = randomInt

    if let title = noteTextField.text {
      data[TodoListKey.title.rawValue] = title
    }

    event?.addListTapped(data: data)
  }

  // MARK: - View
  func showInformation(withMessage: String) {
    alertView = UIAlertController(title: "", message: withMessage, preferredStyle: .alert)
    alertView?.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

    present(alertView!, animated: true, completion: nil)
  }
}
