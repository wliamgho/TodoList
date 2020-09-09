//
//  DetailViewController.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, NibInstantiable {
  @IBOutlet weak var titleLabel: UILabel!
  private var viewModel: DetailViewModel!

  static func create(to viewModel: DetailViewModel) -> DetailViewController {
    let view = DetailViewController.instantiateViewController()
    view.viewModel = viewModel
    return view
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    titleLabel.text = "Welcome, \(viewModel.name)"
  }
}
