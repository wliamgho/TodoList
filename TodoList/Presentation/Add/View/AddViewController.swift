//
//  AddViewController.swift
//  TodoList
//
//  Created by William on 09/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, NibInstantiable {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var todoTextField: UITextField!
  @IBOutlet weak var dateTextField: UITextField!
  @IBOutlet weak var scrollView: UIScrollView!

  private var datePicker: UIDatePicker!

  private var viewModel: AddViewModel!

  static func create(to viewModel: AddViewModel) -> AddViewController {
    let view = AddViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    scrollView.isScrollEnabled = false
    dateTextField.tintColor = .clear

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissTapView))
    self.view.addGestureRecognizer(tapGesture)

    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillShow(notification:)),
                                           name: UIResponder.keyboardWillShowNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification,
                                           object: nil)
  }

  private func showDatePicker() {
    datePicker = UIDatePicker()
    datePicker.setDate(Date(), animated: true)

    dateTextField.inputView = datePicker

    let doneButton = UIBarButtonItem(title: "Done",
                                     style: .done,
                                     target: self,
                                     action: #selector(self.doneDateSelection))
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
    toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton], animated: true)
    dateTextField.inputAccessoryView = toolBar
  }

  // MARK: - ACTION
  @objc private func keyboardWillShow(notification: NSNotification) {
    guard let info = notification.userInfo else { return }

    if var keyboardFrame = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      keyboardFrame = self.view.convert(keyboardFrame, from: nil)

      var contentInset = self.scrollView.contentInset
      contentInset.bottom = keyboardFrame.size.height
      scrollView.contentInset = contentInset
      scrollView.isScrollEnabled = true
    }
  }

  @objc private func keyboardWillHide() {
    scrollView.contentInset = .zero
    scrollView.isScrollEnabled = false
  }
  
  @objc private func dismissTapView() {
    view.endEditing(true)
  }

  @objc private func doneDateSelection() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
    let convertedDate = dateFormatter.string(from: datePicker.date)

    dateTextField.text = convertedDate

    view.endEditing(true)
  }
  
  @IBAction func dateFieldTapped(_ sender: Any) {
    showDatePicker()
  }

  @IBAction func addButtonTapped(_ sender: Any) {
    guard let todoText = todoTextField.text, let dateText = dateTextField.text else { return }

    viewModel.addTodoItem(todo: TodoModel(todo: todoText, date: dateText), completion: { _ in
      self.navigationController?.popViewController(animated: true)
    })
  }
}

extension AddViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
      nextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }

    return false
  }
}
